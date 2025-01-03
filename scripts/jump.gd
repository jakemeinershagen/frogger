extends State

@export var jump_size = 32
@export var lerp_amount = 0.25

var direction = Vector2.UP
var target_position = Vector2.ZERO

func enter_state():
	super()
	lock = true
	if Input.is_action_just_pressed("forward"):
		direction = Vector2.UP
		target_position = player.position + (Vector2.UP * jump_size)
	elif Input.is_action_just_pressed("back"):
		direction = Vector2.DOWN
		target_position = player.position + (Vector2.DOWN * jump_size)
	elif Input.is_action_just_pressed("left"):
		direction = Vector2.LEFT
		target_position = player.position + (Vector2.LEFT * jump_size)
	elif Input.is_action_just_pressed("right"):
		direction = Vector2.RIGHT
		target_position = player.position + (Vector2.RIGHT * jump_size)


func process_state(_delta: float) -> void:
	player.position = lerp(player.position, target_position, lerp_amount)
	if (player.position - target_position).length() < Vector2(0.005, 0.005).length():
		player.position = target_position.ceil()
		lock = false
