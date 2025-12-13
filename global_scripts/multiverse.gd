class_name Multiverse
extends Node

var universes : Array[Universe]
var holder_universe : Universe
var current_universe : Universe

func _ready() -> void:
	current_universe = Omniverse.make_universe()

func get_current_universe() -> Universe:
	return current_universe
