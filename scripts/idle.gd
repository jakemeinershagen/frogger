extends State

func enter_state():
	super()
	player.velocity = Vector2.ZERO
	if player.curr_log != null:
		player.velocity += player.curr_log.velocity

func process_state(delta: float) -> void:
	if player.in_water_region and player.curr_log == null:
		player.die()
	player.move_and_collide(player.velocity * delta)
