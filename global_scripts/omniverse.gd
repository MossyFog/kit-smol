class_name Omniverse
extends Node
## Omniverse

var multiverses : Array[Multiverse]
var holder_multiverse : Multiverse
var current_multiverse : Multiverse

func _ready() -> void:
	holder_multiverse = Multiverse.new()
	multiverses.push_back(holder_multiverse)

func make_multiverse() -> Multiverse:
	var new_multiverse = Multiverse.new()
	multiverses.push_back(new_multiverse)
	return new_multiverse

func make_universe() -> Universe:
	var new_universe = Universe.new()
	holder_multiverse.holder_universe = holder_multiverse.current_universe
	new_universe.current_universe = new_universe
	return new_universe
	

func get_current_universe() -> Universe:
	return current_multiverse.get_current_universe()

func set_current_universe(universe : Universe) -> void:
	if (current_multiverse == null):
		current_multiverse.current_universe = make_universe()

func get_all_multiverses() -> Array[Multiverse]:
	return multiverses
