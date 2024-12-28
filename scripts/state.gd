extends Node
class_name State

## animation that should be played by this script
@export var animation_name: String
## names of states that this state is allowed to transition to
@export var allowed_transitions: Array[String]
@export var disable_warnings: bool = false

# these two should be set by the state_machine
var animation: AnimatedSprite2D
var player: CharacterBody2D

var lock = false

func _ready() -> void:
	# if no animation_name is set it will use the node name
	if not animation_name:
		animation_name = name.to_lower()
		if not disable_warnings:
			push_warning(
				"{name} has no animation_name defined, setting animation_name to {name_lower}"
				.format({"name": name, "name_lower": name.to_lower()})
			)
	if not allowed_transitions and not disable_warnings:
		push_warning("Allowed Transitions list is empty. This will allow tranistion to any state from this one.")


func _enter_state():
	# not sure what happens if we give an invalid name. guess we'll see someday
	if animation_name and animation:
		animation.play(animation_name)


func _exit_state():
	pass
