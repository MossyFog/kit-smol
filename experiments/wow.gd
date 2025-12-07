extends PopupMenu
var submenus : Array[PopupMenu]
@onready var lbl : Label = $"../../PanelContainer/TabContainer/Debuggery"

func _ready() -> void:
	submenus = populate_submenus()
	for i in submenus:
		add_submenu_node_item(i.name, i)
		var subsubmenus = populate_submenus()
		for j in subsubmenus:
			i.add_submenu_node_item(j.name, j)
			var subsubsubmenus = populate_submenus()
			for k in subsubsubmenus:
				j.add_submenu_node_item(k.name, k)
		#lbl.text = (lbl.text + "\n" + str(i.name) + " added.")

func populate_submenus() -> Array[PopupMenu]:
	var new_submenus : Array[PopupMenu]
	var test_submenus : Array[Submenu] = [
		Submenu.new("Stuff1"),
		Submenu.new("Stuff2"),
		Submenu.new("Stuff3"),
		Submenu.new("Stuff4"),
	]
	for i in test_submenus:
		new_submenus.push_back(i.node)
	return new_submenus
