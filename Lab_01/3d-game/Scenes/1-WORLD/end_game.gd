extends Camera3D

@onready var time: Label = $CanvasLayer/Time
@onready var coin_collector: Label = $"CanvasLayer/Coin Collector"
@onready var player: CharacterBody3D = $"../Player"
@onready var lose: Label = $CanvasLayer/Lose
@onready var restart: Label = $CanvasLayer/Restart

func _process(delta: float) -> void:
	if (!player):
		time.visible = true
		coin_collector.visible = true
		lose.visible = true
		restart.visible = true
