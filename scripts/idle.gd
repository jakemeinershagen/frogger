extends State

func enter_state():
	super()
	player.velocity = Vector2.ZERO
	if player.curr_log != null:
		player.velocity += player.curr_log.velocity

func process_state(delta: float) -> void:
	player.move_and_collide(player.velocity * delta)
