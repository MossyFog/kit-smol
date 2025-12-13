class_name Level
extends Node2D

@export var main_spawner := Respawnery.new().spawn_point

func verify() -> bool:
	return true
