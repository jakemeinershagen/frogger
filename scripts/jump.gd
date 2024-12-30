extends State

@export var jump_size = 32
@export var lerp_amount = 0.2

var direction = Vector2.UP
var target_position = Vector2.ZERO

func enter_state():
	lock = true
	if Input.is_action_just_pressed("forward"):
		direction = Vector2.UP
		target_position = player.position + (Vector2.UP * jump_size)


func process_state(delta: float) -> void:
	player.position = lerp(player.position, target_position, lerp_amount)
	if player.position == target_position:
		lock = false
