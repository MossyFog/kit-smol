extends Level

var level_name : String
var can_exit : bool

func _init() -> void:
	level_name = "Level Test 01"

func _ready() -> void:
	can_exit = omniverse.tester.exit_reachable()
