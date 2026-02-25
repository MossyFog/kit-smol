class_name Omniverse
extends Node
## Omniverse

var universes : Array[Array]
var current_universe : Universe
var tester : Tester = Tester.new()

func _ready() -> void:
	current_universe = make_universe()

func make_universe() -> Universe:
	var new_universe = Universe.new()
	if current_universe == null:
		current_universe = new_universe
	return new_universe

class Tester:
	func exit_reachable() -> bool:
		# check if there's a flippin' exit
		# check if the exit is reachable
		return true
