extends CollisionShape3D

@export var physics_body:Node3D

@export var template_mesh:PlaneMesh
@onready var faces = template_mesh.get_faces()
@onready var snap = Vector3.ONE * template_mesh.size.x/2

func _ready():
	update_shape()
	
	
func _physics_process(delta):
	var player_rounded_position = physics_body.global_position.snapped(snap) * Vector3(1,0,1)
	if not global_position == player_rounded_position:
		global_position = player_rounded_position
		update_shape()
	
func update_shape():
	for i in faces.size():
		var global_vert = faces[i] + global_position
		faces[i].y = Heightmap.get_height(global_vert.x,global_vert.z)
	shape.set_faces(faces)
