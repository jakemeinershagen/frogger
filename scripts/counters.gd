extends Control

@onready var lives_label = $Lives
@onready var score_label = $Score


func _process(_delta: float) -> void:
	lives_label.text = "Lives: %d" % Shared.lives
	score_label.text = "Score: %d" % Shared.full_pads
