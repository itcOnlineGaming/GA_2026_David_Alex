extends CharacterBody3D

@export var SPEED : float = 5.0
@export var WALK_SPEED : float = 4.0

@export var SPRINT_SPEED: float = 10.0
@export var SPRINT_TIME: float = 0.5
@export var SLOW_SPEED: float = 1.0

var sprinting: bool = false
var sprintFull: bool = true
var currentSprintRemaining: float = 0.0
@export var sprintMode: bool = true
@export var SENSITIVITY : Vector2 = Vector2(0.001,0.003)
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var head: Node3D = $HEAD
@onready var camera: Camera3D = $HEAD/Camera3D
@onready var player: CharacterBody3D = $"."

@onready var coin_collector: Label = $"HEAD/Camera3D/CanvasLayer/Coin Collector"
@onready var time: Label = $HEAD/Camera3D/CanvasLayer/Time
var number_time : int = 0
var collected_Coin : int = 0

func _init() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	currentSprintRemaining = SPRINT_TIME
	SPEED = WALK_SPEED
	var random = RandomNumberGenerator.new()
	random.randomize()
	var num = random.randi_range(0,1)
	if num == 0:
		sprintMode = true
	else:
		sprintMode = false
	

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		player.rotate_y(-event.relative.x * SENSITIVITY.x)
		camera.rotate_x(-event.relative.y * SENSITIVITY.y)
		camera.rotation.x = clamp(camera.rotation.x,deg_to_rad(-40),deg_to_rad(60))

func _process(delta: float) -> void:
	time.text = "Time : " + str(number_time)
	
	if Input.is_action_just_pressed("Sprint"):
		sprinting = true
		
	if Input.is_action_just_released("Sprint"):
		sprinting = false
		
	if sprinting and sprintMode and sprintFull:
		if currentSprintRemaining > 0:
			currentSprintRemaining -= delta
			SPEED = SPRINT_SPEED
	if currentSprintRemaining <= 0:
		sprintFull = false
		SPEED = SLOW_SPEED
	if sprintMode:
		if not sprinting:
			currentSprintRemaining += delta
		if currentSprintRemaining >= SPRINT_TIME:
			sprintFull = true
			currentSprintRemaining = SPRINT_TIME
			SPEED = WALK_SPEED
			


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
	


func _on_hit_box_area_shape_entered(area_rid: RID, area: Area3D, area_shape_index: int, local_shape_index: int) -> void:
	if area && area.name == "Enemy_HitBox":
		player.queue_free()
		
	if area && area.name == "Coin_Hitbox":
		collected_Coin = collected_Coin + 1


func _on_timer_timeout() -> void:
	number_time = number_time + 1
	
func get_Coins()-> int:
	return collected_Coin
	
func get_time()-> int:
	return number_time
