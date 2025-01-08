extends Node

var full_pads = 0
var win = null
var lives = 3

func _process(_delta: float) -> void:
	if full_pads >= 5:
		win = true
	if lives < 0:
		win = false


func reset():
	full_pads = 0
	win = null
	lives = 3
	get_tree().paused = false
