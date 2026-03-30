extends Node


signal coin_picked_up(coin: Coin)


func emit_coin_picked_up(coin: Coin) -> void:
	coin_picked_up.emit(coin)
