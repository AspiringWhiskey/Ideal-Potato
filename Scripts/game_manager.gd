extends Node

signal coins_updated(new_total: int)
signal hearts_updated(new_hearts: int)

var coins: int = 0
var max_hearts: int = 3
var hearts: int = 3

func add_coin(amount: int = 1) -> void:
	coins += amount
	coins_updated.emit(coins)

func lose_heart(amount: int = 1) -> void:
	hearts = max(hearts - amount, 0)
	hearts_updated.emit(hearts)
	
	if hearts <= 0:
		reset_game()
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/level_01.tscn")
	else:
		get_tree().call_deferred("reload_current_scene")

func reset_game() -> void:
	coins = 0
	hearts = max_hearts
	coins_updated.emit(coins)
	hearts_updated.emit(hearts)
