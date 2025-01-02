extends StaticBody2D

var SPEED = 50
var DIRECTION = Vector2.RIGHT


func _ready() -> void:
	if DIRECTION == Vector2.RIGHT:
		$Sprite2D.flip_h = true
	elif DIRECTION == Vector2.LEFT:
		$Sprite2D.flip_h = false


func _physics_process(delta: float) -> void:
	position += DIRECTION * SPEED * delta
