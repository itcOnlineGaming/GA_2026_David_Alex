extends Camera3D

@onready var player: CharacterBody3D = $"../Player"

@onready var coin_collector: Label = $"CanvasLayer/Coin Collector"
@onready var restart: Label = $CanvasLayer/Restart
@onready var lose: Label = $CanvasLayer/Lose
@onready var time: Label = $CanvasLayer/Time

func _ready() -> void:
	pass

func _death():
	
	coin_collector.text = "Coins Collected : " + str(player.get_Coins())
	time.text = "Time Lasted : " + str(player.get_time())
	
	coin_collector.visible = true
	restart.visible = true
	lose.visible = true
	time.visible = true
	
	Csv.save_to_csv(player.get_sprinting() ,player.get_Coins())
	
