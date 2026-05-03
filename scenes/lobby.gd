extends Node3D
class_name Lobby

@onready var player := preload("res://scenes/Player/player.tscn").instantiate()
func _ready():
	AudioManager.play_music("train")
	add_child(player)
	#player.global_position +=Vector3(0,5,0)
	pass
