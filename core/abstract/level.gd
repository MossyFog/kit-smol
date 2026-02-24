class_name Level
extends Node2D

@export var main_spawn := Respawnery.new()
@onready var main_spawn_point = main_spawn.spawn_point



func verify() -> bool:
	return true
