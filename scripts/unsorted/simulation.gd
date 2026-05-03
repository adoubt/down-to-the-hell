extends Node3D

@export var pool_size := 120

@export var z_min := -400.0
@export var z_max := 400.0
@export var speed := 165.0

@export var x_min := 40.0
@export var x_max := 140.0
@export var y_min := -2.0
@export var y_max := 6.0

# масштаб
@export var scale_min := Vector3(0.5, 0.8, 0.5)
@export var scale_max := Vector3(8.0, 18.0, 8.0)

# свет
@export var light_probability := 0.18
@export var max_active_lights := 16
@export var light_energy_min := 0.6
@export var light_energy_max := 2.5
@export var light_range_min := 6.0
@export var light_range_max := 28.0

var meshes: Array[Mesh] = []
var materials: Array[Material] = []

class Item:
	var node: MeshInstance3D
	var light: OmniLight3D
	var has_light := false

var pool: Array[Item] = []
var active_lights := 0

func _ready():
	randomize()
	_init_meshes()
	_init_materials()
	_init_pool()

func _process(delta):
	for it in pool:
		var m := it.node
		m.position.z += speed * delta
		
		if m.position.z > z_max:
			_reset_item(it)

func _reset_item(it: Item):
	var m := it.node
	
	# --- генерируем всё заранее ---
	var z := z_min - randf_range(20.0, 120.0)
	
	var side := -1.0 if (randi() & 1) == 0 else 1.0
	var x := side * randf_range(x_min, x_max)
	var y := randf_range(y_min, y_max)
	
	var rot_y := randf() * TAU
	
	# масштаб
	var k := pow(randf(), 2.2)
	var sx = lerp(scale_min.x, scale_max.x, k)
	var sy = lerp(scale_min.y, scale_max.y, pow(randf(), 1.6))
	var sz = lerp(scale_min.z, scale_max.z, k)
	var scale_vec := Vector3(sx, sy, sz)
	
	# LOD от НОВОЙ позиции
	var dist_norm = clamp(abs(z) / z_max, 0.0, 1.0)
	scale_vec *= lerp(0.7, 1.4, dist_norm)
	
	# меш/материал
	m.mesh = meshes[randi() % meshes.size()]
	m.set_surface_override_material(0, materials[randi() % materials.size()])
	
	# --- применяем ОДНИМ transform ---
	var t := Transform3D()
	t.origin = Vector3(x, y, z)
	t.basis = Basis().rotated(Vector3.UP, rot_y).scaled(scale_vec)
	m.transform = t
	
	# --- свет ---
	var want_light := randf() < light_probability
	
	if want_light and active_lights < max_active_lights:
		if not it.has_light:
			active_lights += 1
			it.has_light = true
		
		var l := it.light
		l.visible = true
		l.light_energy = randf_range(light_energy_min, light_energy_max)
		l.omni_range = randf_range(light_range_min, light_range_max)
		l.light_color = Color.from_hsv(randf(), 0.7, 1.0)
		l.position = Vector3(0, sy * 0.3, 0)
	else:
		if it.has_light:
			active_lights -= 1
			it.has_light = false
		it.light.visible = false
# ---------- INIT ----------

func _init_pool():
	for i in pool_size:
		var m := MeshInstance3D.new()
		add_child(m)
		
		var it := Item.new()
		it.node = m
		
		# свет создаётся один раз и переиспользуется
		var l := OmniLight3D.new()
		l.visible = false
		m.add_child(l)
		it.light = l
		
		pool.append(it)
		
		_apply_random_visual(it)
		_place_at_start(it, randf_range(z_min, z_max))

func _init_meshes():
	meshes.clear()
	
	var box := BoxMesh.new()
	box.size = Vector3.ONE
	meshes.append(box)
	
	var cyl := CylinderMesh.new()
	cyl.top_radius = 0.5
	cyl.bottom_radius = 0.5
	cyl.height = 2.0
	meshes.append(cyl)
	
	var prism := PrismMesh.new()
	prism.size = Vector3.ONE
	meshes.append(prism)
	
	var sphere := SphereMesh.new()
	sphere.radius = 1.0
	meshes.append(sphere)
	
	var capsule := CapsuleMesh.new()
	capsule.radius = 0.5
	capsule.height = 2.0
	meshes.append(capsule)

func _init_materials():
	materials.clear()
	for i in 16:
		var mat := StandardMaterial3D.new()
		mat.albedo_color = Color.from_hsv(randf(), 0.5, 0.9)
		materials.append(mat)

# ---------- LOGIC ----------

func _place_at_start(it: Item, z_pos: float):
	var m := it.node
	
	var side := -1.0 if (randi() & 1) == 0 else 1.0
	var x := side * randf_range(x_min, x_max)
	var y := randf_range(y_min, y_max)
	
	m.position = Vector3(x, y, z_pos)
	m.rotation.y = randf() * TAU

func _apply_random_visual(it: Item):
	var m := it.node
	
	# меш/материал из кэша
	m.mesh = meshes[randi() % meshes.size()]
	m.set_surface_override_material(0, materials[randi() % materials.size()])
	
	# нелинейный разброс масштаба (смещён к мелким, редкие крупные)
	var k := pow(randf(), 2.2) # 0..1, bias к 0
	var sx = lerp(scale_min.x, scale_max.x, k)
	var sy = lerp(scale_min.y, scale_max.y, pow(randf(), 1.6))
	var sz = lerp(scale_min.z, scale_max.z, k)
	m.scale = Vector3(sx, sy, sz)
	
	# LOD-подобное поведение: дальние крупные, ближние мелкие
	var dist_norm = clamp(abs(m.position.z) / z_max, 0.0, 1.0)
	m.scale *= lerp(0.7, 1.4, dist_norm)
	
	# свет с бюджетом
	var want_light := randf() < light_probability
	
	if want_light and active_lights < max_active_lights:
		if not it.has_light:
			active_lights += 1
			it.has_light = true
		
		var l := it.light
		l.visible = true
		l.light_energy = randf_range(light_energy_min, light_energy_max)
		l.omni_range = randf_range(light_range_min, light_range_max)
		l.light_color = Color.from_hsv(randf(), 0.7, 1.0)
		
		# небольшой сдвиг, чтобы не совпадал с центром меша
		l.position = Vector3(0, sy * 0.3, 0)
	else:
		if it.has_light:
			active_lights -= 1
			it.has_light = false
		it.light.visible = false
