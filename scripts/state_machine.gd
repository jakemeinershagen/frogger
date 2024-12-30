extends Node
class_name StateMachine

@export var player: CharacterBody2D
@export var animation: AnimatedSprite2D
@export var start_state: State
@export var disable_warnings: bool = false

var states: Dictionary = {}
var curr_state: State


func register_states():
	if not player and not disable_warnings:
		push_warning("player is not defined on state machine called %s" % name)
	if not animation and not disable_warnings:
		push_warning("animation is not defined on state machine called %s" % name)
	
	for child in get_children():
		if child is State:
			child.player = player
			child.animation = animation
			states[child.name.to_lower()] = child


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	register_states()
	
	assert(start_state, "No start state provided.")
	curr_state = states[start_state.name.to_lower()]
	curr_state.enter_state()


## changes state to target, if state is in allowed transitions and lock is not true
func change_state(target_state: String) -> bool:
	if target_state not in states:
		return false
	if curr_state.lock:
		return false
	if (len(curr_state.allowed_transitions) > 0
		and target_state not in curr_state.allowed_transitions):
		return false
	curr_state.exit_state()
	curr_state = states[target_state]
	curr_state.enter_state()
	return true


## this isn't implemented yet because I haven't needed it.
func force_change_state():
	## this would be something to use only if you really mean it.
	assert(false, "this isn't implemented yet because I haven't needed it.")


func _process(delta: float) -> void:
	curr_state.process_state(delta)
