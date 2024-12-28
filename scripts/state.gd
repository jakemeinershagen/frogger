extends Node
class_name State


# these two should be set by the state_machine
var animation: AnimatedSprite2D
var player: CharacterBody2D

@export var animation_name: String


func _ready() -> void:
	# if no animation_name is set it will use the node name
	if not animation_name:
		animation_name = name.to_lower()
		push_warning(
			"{name} has no animation_name defined, setting animation_name to {name_lower}"
			.format({"name": name, "name_lower": name.to_lower()})
		)


func _enter_state():
	# not sure what happens if we give an invalid name. guess we'll see someday
	if animation_name and animation:
		animation.play(animation_name)


func _exit_state():
	pass
