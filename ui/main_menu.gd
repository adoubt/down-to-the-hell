extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_settings_pressed() -> void:
	UIManager.open_panel("Settings")
	_sound()

func _on_exit_pressed() -> void:
	SceneManager.exit()
	_sound()


func _on_game_test_pressed() -> void:


	SceneManager.go_to_game_test()
	_sound()

func _on_button_2_pressed() -> void:
	SceneManager._go_to_big_room_test()
	_sound()

func _on_join_pressed() -> void:
	SceneManager.go_to_game_test()
	_sound()
func _sound()->void :
	AudioManager.play_ui_sound("menu_select")


func _on_new_run_pressed() -> void:
	SceneManager.go_to_lobby()
	_sound()
