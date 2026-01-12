extends Node

const COIN = preload("res://Scenes/4-COINS/Coin.tscn")

@onready var t_1: Node3D = %"1"
@onready var t_2: Node3D = %"2"
@onready var t_3: Node3D = %"3"
@onready var t_4: Node3D = %"4"


func _ready() -> void:
	var pool = [t_1, t_2, t_3, t_4]
	var currentCoin = COIN.instantiate()
	add_child(currentCoin)
	var childTS = pool.pick_random().transform
	currentCoin.transform = childTS
	currentCoin.CoinPoints = self

func spawn_new_coin() -> void:
	var pool = [t_1, t_2, t_3, t_4]
	var currentCoin = COIN.instantiate()
	add_child(currentCoin)
	var childTS = pool.pick_random().transform
	currentCoin.transform = childTS
	currentCoin.CoinPoints = self
