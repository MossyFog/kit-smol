class_name Omniverse
extends Node
## Omniverse

var test = preload("res://core/utility/tester.gd")
var phys = preload("res://core/abstract/physics_set.gd")

## All available and loaded universes
var universes : Array[Universe]
## The current universe
var current_universe : Universe
## Tests things
var tester = test.Tester.new()

## Universe readying and setup
func _ready() -> void:
	setup_physics(phys)
	var new_universe = make_universe()
	if current_universe == null:
		current_universe = new_universe
	

func setup_physics(physicsSet) -> void:
	pass

func make_universe() -> Universe:
	var new_universe = Universe.new()
	return new_universe
