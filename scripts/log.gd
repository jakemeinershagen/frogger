extends StaticBody2D

var SPEED = 50
var direction = Vector2.RIGHT


func set_direction(new_direction) -> void:
	direction = new_direction


func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta
