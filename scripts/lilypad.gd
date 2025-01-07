extends StaticBody2D
class_name Lilypad

@onready var filled = false

func set_filled():
	filled = true
	$FrogSprite.visible = true
	Shared.full_pads += 1
