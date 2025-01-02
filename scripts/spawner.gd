extends Node2D

@export var OBJECT_TO_SPAWN: PackedScene
@export var DIRECTION: Vector2
@export var MINIMUM_DISTANCE: int

var last_object_spawned: Node2D = null

func _process(_delta: float) -> void:
	if (last_object_spawned != null
		and (last_object_spawned.global_position - global_position).length() < MINIMUM_DISTANCE):
		return

	var spawned_object =  OBJECT_TO_SPAWN.instantiate()
	add_child(spawned_object)
	
	spawned_object.DIRECTION = DIRECTION
	spawned_object.global_position = global_position
	
	last_object_spawned = spawned_object
