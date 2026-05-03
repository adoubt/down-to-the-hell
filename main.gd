extends Node

func _ready() -> void:
	UIManager.register_panel("PostProcess", preload("res://ui/post_process_panel.tscn").instantiate())
	UIManager.register_panel("MainMenu", preload("res://ui/main_menu.tscn").instantiate())
	UIManager.register_panel("Settings", preload("res://ui/Settings.tscn").instantiate())
	UIManager.register_panel("HUD", preload("res://ui/hud.tscn").instantiate())
	UIManager.register_panel("DEV_PANEL",preload("res://ui/dev_panel.tscn").instantiate())
	UIManager.register_panel("EscapeMenu",preload("res://ui/esc_menu.tscn").instantiate())
	
	SceneManager.go_to_intro()
