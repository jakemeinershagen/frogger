extends Node2D

@export var OBJECT_TO_SPAWN: PackedScene
@export var DIRECTION: Vector2
@export var MIN_DISTANCE: int = 50
@export var MAX_DISTANCE: int = 500
@export var SPEED: int = 50

var last_object_spawned: Node2D = null
var next_distance

func _process(_delta: float) -> void:
	if (last_object_spawned != null
		and (last_object_spawned.global_position - global_position).length() < next_distance):
		return

	var spawned_object =  OBJECT_TO_SPAWN.instantiate()
	add_child(spawned_object)
	
	spawned_object.set_direction(DIRECTION)
	spawned_object.SPEED = SPEED
	spawned_object.global_position = global_position
	
	last_object_spawned = spawned_object
	next_distance = randi_range(MIN_DISTANCE, MAX_DISTANCE)
