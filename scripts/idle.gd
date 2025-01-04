extends State

func process_state(delta: float) -> void:
	player.move_and_collide(player.velocity * delta)
