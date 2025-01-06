extends CharacterBody2D

@onready var state_machine = $StateMachine
@onready var start_position = position

var curr_log = null
var in_water_region = false


func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("forward")
		or Input.is_action_just_pressed("back")
		or Input.is_action_just_pressed("left")
		or Input.is_action_just_pressed("right")):
		state_machine.change_state("jump")
	else:
		state_machine.change_state("idle")


func reset():
	in_water_region = false
	curr_log = null
	state_machine.force_change_state("idle")
	
	position = start_position
	print("reset")


func die():
	reset()
	
	print("died")


func check_lilypad(body: Lilypad):
	if body.filled:
		return
	body.filled = true
	Shared.full_pads += 1
	print("full pads: {0}".format([Shared.full_pads]))


func _on_log_detector_body_entered(body: Node2D) -> void:
	if body is Log:
		curr_log = body
	elif body is Car:
		die()
	elif body is Lilypad:
		check_lilypad(body)
		reset()


func _on_log_detector_body_exited(body: Node2D) -> void:
	if body is Log and body == curr_log:
		curr_log = null


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	die()


func _on_water_area_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		in_water_region = true


func _on_water_area_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		in_water_region = false
