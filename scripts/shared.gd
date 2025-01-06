extends Node

var full_pads = 0
var win = false

func _process(delta: float) -> void:
	if full_pads >= 5:
		win = true
