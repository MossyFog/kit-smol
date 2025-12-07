class_name Submenu
extends RefCounted

var name : String
var node : PopupMenu
func _init(p_name : String, parent = null) -> void:
	_setup(p_name, parent)

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
		error_string(ERR_INVALID_PARAMETER)

func _setup(p_name : String, parent = null) -> void:
	print("Submenu init test")
	node = PopupMenu.new()
	name = p_name
	node.name = name
	add_parent(parent)
