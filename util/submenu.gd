class_name Submenu
extends Node
## A [Submenu] is a [Node] which

var name_menu : String
var node : PopupMenu
var designated_parent : Node
var has_subsubmenu : bool


func _init(p_name : String, parent : Node = null) -> void:
	if parent != null:
		designated_parent = parent
		if designated_parent is Submenu:
			_setup(p_name, designated_parent.node)
		elif designated_parent is PopupMenu:
			_setup(p_name, null)
	else:
		pass

func _ready() -> void:
	pass


## Returns 
func add_to(array_of_submenus: Array) -> Submenu:
	array_of_submenus.push_back(self)
	return self


func add_parent(parent) -> void:
	if parent is PopupMenu:
		#node.reparent(parent)
		node.add_submenu_node_item(node.name, designated_parent)
	elif parent is Submenu:
		node.add_submenu_node_item(node.name, node)
	elif parent == null:
		pass
	else:
		printerr(error_string(ERR_INVALID_PARAMETER))


func _setup(p_name : String, parent = null) -> void:
	node = PopupMenu.new()
	name_menu = p_name
	node.name = name
	add_parent(parent)
