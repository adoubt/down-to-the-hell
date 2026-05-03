extends Node3D

@export var pos_amplitude := Vector3(0.45, 0.32, 0.45)
@export var rot_amplitude := Vector3(0.5, 0.4, 0.5)
@export var speed := 10.5

var noise := FastNoiseLite.new()
var time := 0.0

class WagonData:
	var node: Node3D
	var base_pos: Vector3
	var base_rot: Vector3
	var offset: float

var wagons: Array[WagonData] = []

const NOISE_OFFSET_1 := 50.0
const NOISE_OFFSET_2 := 100.0

func _ready():
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX

	for child in get_children():
		if child is Node3D:
			var w := WagonData.new()
			w.node = child
			w.base_pos = child.position
			w.base_rot = child.rotation # сразу в радианах
			w.offset = randf() * 1000.0
			
			wagons.append(w)

func _process(delta):
	time += delta * speed

	for w in wagons:
		var t := time + w.offset

		var n1 := noise.get_noise_1d(t)
		var n2 := noise.get_noise_1d(t + NOISE_OFFSET_1)
		var n3 := noise.get_noise_1d(t + NOISE_OFFSET_2)

		var px := w.base_pos.x + n1 * pos_amplitude.x
		var py := w.base_pos.y + n2 * pos_amplitude.y
		var pz := w.base_pos.z + n3 * pos_amplitude.z
		w.node.position = Vector3(px, py, pz)

		var rx := w.base_rot.x + n2 * rot_amplitude.x
		var ry := w.base_rot.y + n3 * rot_amplitude.y
		var rz := w.base_rot.z + n1 * rot_amplitude.z
		w.node.rotation = Vector3(rx, ry, rz)
