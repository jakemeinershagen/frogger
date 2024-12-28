extends Node
class_name StateMachine


@export var player: CharacterBody2D
@export var animation: AnimatedSprite2D
@export var disable_warnings: bool = false

var states: Dictionary = {}


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
