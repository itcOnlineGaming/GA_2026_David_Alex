extends Node

@onready var player = $Player 

func _physics_process(delta):
	if (player):
		get_tree().call_group("enemies", "", player.global_transform.origin)

func _process(delta):
	if Input.is_action_just_pressed("Restart"):
		get_tree().reload_current_scene()
