class_name Omniverse
extends Node
## Omniverse

var multiverses : Array[Multiverse]
var holder_multiverse : Multiverse
var current_multiverse : Multiverse

func _ready() -> void:
	holder_multiverse = Multiverse.new()
	holder_multiverse.universes.push_back(make_universe())
	holder_multiverse.current_universe = holder_multiverse.universes[0]
	multiverses.push_back(holder_multiverse)

func make_multiverse() -> Multiverse:
	var new_multiverse = Multiverse.new()
	multiverses.push_back(new_multiverse)
	return new_multiverse

func make_universe() -> Universe:
	var new_universe = Universe.new()
	if (current_multiverse.current_universe != null):
		holder_multiverse.holder_universe = holder_multiverse.current_universe
	current_multiverse.current_universe = new_universe
	return new_universe

func get_current_universe() -> Universe:
	return current_multiverse.get_current_universe()

func set_current_universe(universe : Universe) -> void:
	if (current_multiverse != null):
	# check if universe exists in multiverses er somethin' iono
	# then.. then uhh.. then... yeahhhh!
		current_multiverse.current_universe = universe

func get_all_multiverses() -> Array[Multiverse]:
	return multiverses

func get_all_universes() -> Array[Universe]:
	var all_universes : Array[Universe]
	for u in multiverses:
		all_universes.push_back(u)
	return all_universes
