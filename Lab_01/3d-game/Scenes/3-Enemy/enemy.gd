extends CharacterBody3D

@onready var navigation_agent_3d: NavigationAgent3D = $NavigationAgent3D


	
func update_target_location(target_location):
	navigation_agent_3d.set_target_location(target_location)
	
