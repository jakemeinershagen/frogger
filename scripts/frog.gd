extends CharacterBody2D

@onready var animationSprite: AnimatedSprite2D = $Animation
@onready var target_position = position

var jump_size = 32

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("forward"):
		animationSprite.play("jump")
		target_position = position + (Vector2.UP * jump_size)
	
	position = lerp(position, target_position, 0.2)
