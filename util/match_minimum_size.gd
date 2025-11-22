extends Node
## Supposed to match the minimum size

@export var to_match : Node
var parent : Node


func _ready() -> void:
	parent = get_parent()
	match_sizes()


func match_sizes() -> Error:
	var err = OK
	if (parent is Node2D or parent is Control):
		if parent is Node2D:
			match_node2d_sizes()
		if parent is Control:
			match_control_sizes()
	else:
		err = ERR_DOES_NOT_EXIST
	return err
	

func match_node2d_sizes() -> void:
	to_match.custom_minimum_size = parent.custom_minimum_size
	print("matching node2d min sizes")


func match_control_sizes() -> void:
	to_match.custom_minimum_size = parent.custom_minimum_size
	print("matching control min sizes")
