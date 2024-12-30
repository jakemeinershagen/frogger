extends CharacterBody2D

@onready var state_machine = $StateMachine


func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("forward")
		or Input.is_action_just_pressed("back")
		or Input.is_action_just_pressed("left")
		or Input.is_action_just_pressed("right")):
		state_machine.change_state("jump")
