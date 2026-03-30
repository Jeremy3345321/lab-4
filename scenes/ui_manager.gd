extends Control


@onready var coin_counter: Label = $CoinCounter

var current_coins:= 0

func _ready() -> void:
	WorldObserver.coin_picked_up.connect(_on_coin_picked_up)


func _on_coin_picked_up(_coin: Coin) -> void:
	current_coins += 1
	coin_counter.text = "Coin Counter: " + str(current_coins)
