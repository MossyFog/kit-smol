class_name Submenu
extends Node

var name_menu : String
var node : PopupMenu
var designated_parent : Node

func _init(p_name : String, parent : Node) -> void:
	designated_parent = parent
	_setup(p_name, parent)

func _ready() -> void:
	pass

## Returns 
func add_to(array_of_submenus: Array[Submenu]) -> Submenu:
	array_of_submenus.push_back(self)
	return self


func add_parent(parent) -> void:
	if parent is Submenu or PopupMenu:
		node.reparent(parent)
	elif parent == null:
		pass
	else:
		printerr(error_string(ERR_INVALID_PARAMETER))

func _setup(p_name : String, parent = null) -> void:
	print("Submenu init test")
	node = PopupMenu.new()
	name_menu = p_name
	node.name = name
	add_parent(parent)
