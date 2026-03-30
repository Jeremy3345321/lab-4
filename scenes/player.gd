extends CharacterBody2D

const SPEED:= 220.0
const JUMP_VELOCITY:= -300.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("ui_left"):
		animated_sprite_2d.flip_h = true
	
	if Input.is_action_just_pressed("ui_right"):
		animated_sprite_2d.flip_h = false
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		animated_sprite_2d.play("run")
		velocity.x = direction * SPEED
	else:
		animated_sprite_2d.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
