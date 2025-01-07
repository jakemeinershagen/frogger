extends Node

var full_pads = 0
var win = false
var lives = 3

func _process(_delta: float) -> void:
	if full_pads >= 5:
		win = true


func reset():
	full_pads = 0
	win = false
	lives = 3
