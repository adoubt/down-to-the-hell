extends Area3D




func _on_area_entered(area: Area3D) -> void:
	AudioManager.play_sound("metal_scrach",global_position)
