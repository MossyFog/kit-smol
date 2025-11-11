extends Node
## Supposed to match the minimum size

@export var to_match : Node
var parent : Node

func _ready() -> void:
	parent = get_parent()
	

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
	pass
	
func match_control_sizes() -> void:
	pass
