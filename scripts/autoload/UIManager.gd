extends Node

var owner_id: int = -1
var panels: Dictionary = {}
var force_cursor_visible: bool = false
var last_mouse_state: bool = true
const BASE_RESOLUTION := Vector2(1152, 648)
var canvas :CanvasLayer
var game_paused: bool = false
var _mouse_delta: Vector2 = Vector2.ZERO
var saved_mouse_pos: Vector2

var hud
var dev_panel
# ========== PUBLIC API ==========

func open_settings() -> void:
	var in_main_menu :bool = SceneManager.current_scene_name == "MainMenu"
	_open_panel("Settings",true)
	if in_main_menu:
		_close_panel("MainMenu")
	else:
		_close_panel("EscapeMenu")

func close_settings() -> void:
	var in_main_menu := SceneManager.current_scene_name == "MainMenu"
	if in_main_menu:
		open_panel("MainMenu")
	else:
		open_panel("EscapeMenu")
	
	_close_panel("Settings")


func set_owner_id(_owner_id : int) -> void:
	owner_id = _owner_id
	
func consume_mouse_delta() -> Vector2:
	var d := _mouse_delta
	_mouse_delta = Vector2.ZERO
	return d

func register_panel(panel_name: String, panel_instance: Control) -> void:
	if not canvas:
		_setup_canvas()
	
	if panels.has(panel_name):
		panels[panel_name].queue_free()
	if panel_name == "HUD":
		hud = panel_instance
	if panel_name == "DEV_PANEL":
		dev_panel = panel_instance
	panels[panel_name] = panel_instance
	canvas.add_child(panel_instance)
	panel_instance.visible = false

func open_panel(panel_name: String, use_tween: bool = false) -> void:
	_open_panel(panel_name, use_tween)

func close_panel(panel_name: String, use_tween: bool = false) -> void:
	_close_panel(panel_name, use_tween)

func toggle_panel(panel_name: String) -> void:
	if is_panel_open(panel_name):
		close_panel(panel_name)
	else:
		open_panel(panel_name)

func toggle_escape_menu() -> void:
	toggle_panel("EscapeMenu")
	game_paused = is_panel_open("EscapeMenu")

func is_panel_open(_name: String) -> bool:
	if not panels.has(_name):
		return false

	var panel = panels[_name]
	return is_instance_valid(panel) and panel.visible

		
func _open_panel(_name: String, use_tween: bool = false ) -> void:
	if panels.has(_name):
		var panel = panels[_name]
		
		
		if use_tween:
			panel.scale = Vector2.ZERO
			panel.pivot_offset = panel.size * 0.5
			panel.visible = true
			var tween : Tween = panel.create_tween()
			tween.set_trans(Tween.TRANS_BACK)
			tween.set_ease(Tween.EASE_OUT)
			tween.tween_property(panel, "scale", Vector2.ONE, 0.2)
			await tween.finished.connect(func(): tween.kill)
		else:
			panel.visible = true

		if panel.has_method("play_open_anim"):
			panel.play_open_anim()	
		if panel.has_method("refresh"):
			panel.refresh()
			
	_update_ui_state()

func _close_panel(_name: String, use_tween: bool = false ) -> void:
	if panels.has(_name):
		var panel = panels[_name]
		
		if use_tween:
			
			var tween:Tween = panel.create_tween()
			tween.set_trans(Tween.TRANS_BACK)
			tween.set_ease(Tween.EASE_IN)

			tween.tween_property(panel, "scale", Vector2.ZERO, 0.2)

			tween.finished.connect(func():
				panel.visible = false
			)
		
		else:	panel.visible = false
		_update_ui_state()

func close_all(exclude:=[]) -> void:
	
	for p in panels.keys():
		if p in exclude:
			if not is_panel_open(p):
				_open_panel(p)
			continue
		_close_panel(p) 

	game_paused = false	
	_update_ui_state()



func _ready() -> void:
	_setup_canvas()
	get_viewport().connect("size_changed", Callable(self, "_on_resize"))

func _setup_canvas() -> void:
	if canvas: return
	canvas = CanvasLayer.new()
	canvas.layer = 2
	canvas.name = "Panels"
	add_child(canvas)
	scale_margins_for_resolution()

func _update_ui_state() -> void:
	var ui_open := _any_ui_open() or force_cursor_visible
	

	_show_mouse(ui_open)


func _any_ui_open() -> bool:
	for p in panels.values():
		if p.name == "HUD": continue
		if p.visible:
			return true
	return false

func _show_mouse(visible: bool) -> void:
	if visible == last_mouse_state:
		return
	
	
	last_mouse_state = visible
	Input.set_mouse_mode(
		Input.MOUSE_MODE_VISIBLE if visible else Input.MOUSE_MODE_CAPTURED
	)
	


func _on_resize():
	scale_margins_for_resolution()

func scale_margins_for_resolution():
	var current_res = get_viewport().get_visible_rect().size

	var scale_x = current_res.x / BASE_RESOLUTION.x
	var scale_y = current_res.y / BASE_RESOLUTION.y
	var scale = (scale_x + scale_y) / 2.0

	_apply_margin_scaling(self, scale)


func _apply_margin_scaling(node: Node, scale: float):
	
	if node is MarginContainer:
		for side in ["margin_left", "margin_top", "margin_right", "margin_bottom"]:
			if node.has_theme_constant_override(side):
				var value = node.get_theme_constant(side)
				node.add_theme_constant_override(side, int(value * scale))
	
	for child in node.get_children():
		if child is Control:
			_apply_margin_scaling(child, scale)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Esc"):
		_on_escape_pressed()
	if event.is_action_pressed("restart"):
		SceneManager.restart_current()
	if event.is_action_pressed("DEV_PANEL"):
		if SceneManager.current_scene_name in ["BigRoomTest","GameTest"]:
			
			if is_panel_open("DEV_PANEL"):
				close_panel("DEV_PANEL")
			else:
				open_panel("DEV_PANEL")

	#if event.is_action_pressed("ui_slot_machine"): # Пример нового бинда
		#toggle_panel("SlotMachine")

func _unhandled_input(event):
	if game_paused:
		return

	if event is InputEventMouseMotion \
	and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		_mouse_delta += event.relative	
		
func _on_escape_pressed():
	if is_panel_open("Settings"):
		close_settings()
	#elif is_panel_open("Merchant"):
		#close_merchant_panel()
	#elif is_panel_open("Hat"):
		#close_hat()	
	#elif is_panel_open("Campfire"):
		#close_campfire()	
	#elif is_panel_open("Map"):
		#close_map_panel()
	elif SceneManager.current_scene_name not in ["Intro","MainMenu"]:
		toggle_escape_menu()
