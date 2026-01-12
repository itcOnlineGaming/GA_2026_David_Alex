extends Node

@onready var player = $Player

func _physics_process(delta):
	if (player):
		get_tree().call_group("enemies", "", player.global_transform.origin)
