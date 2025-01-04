extends CharacterBody2D

@onready var state_machine = $StateMachine

var curr_log = null

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("forward")
		or Input.is_action_just_pressed("back")
		or Input.is_action_just_pressed("left")
		or Input.is_action_just_pressed("right")):
		state_machine.change_state("jump")
	else:
		state_machine.change_state("idle")


func _on_log_detector_body_entered(body: Node2D) -> void:
	if body is Log:
		print("Log")
		velocity = body.velocity
		curr_log = body


func _on_log_detector_body_exited(body: Node2D) -> void:
	if body is Log and body == curr_log:
		print("off log")
		velocity = Vector2.ZERO
