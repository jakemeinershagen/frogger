extends StaticBody2D
class_name Car

var SPEED = 50
var direction = Vector2.RIGHT


func _ready() -> void:
	var i = randi_range(0, 3)
	$Sprite2D.frame = i


func set_direction(new_direction) -> void:
	direction = new_direction
	if direction == Vector2.RIGHT:
		$Sprite2D.flip_h = true
	elif direction == Vector2.LEFT:
		$Sprite2D.flip_h = false


func _physics_process(delta: float) -> void:
	position += direction * SPEED * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
