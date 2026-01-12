extends Camera3D

@onready var player: CharacterBody3D = $"../Player"

@onready var coin_collector: Label = $"CanvasLayer/Coin Collector"
@onready var restart: Label = $CanvasLayer/Restart
@onready var lose: Label = $CanvasLayer/Lose
@onready var time: Label = $CanvasLayer/Time


func _process(delta: float) -> void:
	#time.text = "Time : " + str()
	
	
	if (!player):
		coin_collector.visible = true
		restart.visible = true
		lose.visible = true
		time.visible = true
