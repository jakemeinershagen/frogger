extends CharacterBody2D
class_name Log

var SPEED = 50
var direction = Vector2.RIGHT

var body_to_move = null

func set_direction(new_direction) -> void:
	direction = new_direction


func _physics_process(delta: float) -> void:
	velocity = direction * SPEED
	move_and_collide(velocity * delta) 


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
