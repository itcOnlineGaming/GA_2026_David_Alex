extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D

var Speed = 3.0

func _physics_process(delta):
	var current_location
	
func update_target_location(target_location):
	navigation_agent_3d.set_target_location(target_location)
	
	
