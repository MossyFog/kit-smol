class_name LevelControl
extends Node

@export var start_level : Node2D
## Level Control

var ready_to_load = false

func verify_level(level : Level) -> bool:
	return level.verify()

func change_level(level : Level) -> void:
	if (ready_to_load):
		load(level.get_path())
