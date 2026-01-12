extends CharacterBody3D

@export var SPEED : float = 5.0
@export var SENSITIVITY : Vector2 = Vector2(0.001,0.003)

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var head: Node3D = $HEAD
@onready var camera: Camera3D = $HEAD/Camera3D
@onready var player: CharacterBody3D = $"."


func ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	
	
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		player.rotate_y(-event.relative.x * SENSITIVITY.x)
		camera.rotate_x(-event.relative.y * SENSITIVITY.y)
		camera.rotation.x = clamp(camera.rotation.x,deg_to_rad(-40),deg_to_rad(60))


func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= gravity * delta
		
	var input_dir = Input.get_vector("left","right","up","down")
	var direction = (player.transform.basis * Vector3(input_dir.x,0,input_dir.y)).normalized()
	if direction:
		
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = 0.0
		velocity.z = 0.0
	
	move_and_slide()
