extends CanvasLayer

@onready var coin_label: Label = $CoinLabel

func _ready() -> void:
	coin_label.text = "Coins: " + str(GameManager.coins)
	GameManager.coins_updated.connect(_on_coins_updated)

func _on_coins_updated(new_total: int) -> void:
	coin_label.text = "Coins: " + str(new_total)
