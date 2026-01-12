extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D
@export var Player : CharacterBody3D 


var Speed = 3.0

func _physics_process(delta):
	
	if (Player) :
		var current_location = global_transform.origin
		var next_location = Player.transform.origin
		var new_velocity = (next_location - current_location).normalized() * Speed 
	
		velocity = new_velocity
		move_and_slide()
	
func update_target_location(target_location):
	navigation_agent_3d.set_target_location(target_location)
	
	
