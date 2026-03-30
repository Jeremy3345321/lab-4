extends Area2D
class_name Coin

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	animated_sprite_2d.play("default")


func _on_body_entered(_body: Node2D) -> void:
	WorldObserver.emit_coin_picked_up(self)
	queue_free()
