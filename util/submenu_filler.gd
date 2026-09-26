extends PopupMenu
var submenus : Array[PopupMenu]
#@onready var lbl : Label = %Debuggery

func _ready() -> void:
	submenus.push_back(Submenu.new("First", get_parent()))
	submenus = populate_submenus(submenus.front())
	for i in submenus:
		add_submenu_node_item(i.name, i)
		var subsubmenus = populate_submenus(submenus[i])
		for j in subsubmenus:
			i.add_submenu_node_item(j.name, j)
			var subsubsubmenus = populate_submenus(subsubmenus[j])
			for k in subsubsubmenus:
				j.add_submenu_node_item(k.name, k)
		#lbl.text = (lbl.text + "\n" + str(i.name) + " added.")
		
	for i in submenus:
		add_child(i)

func populate_submenus(_parent: PopupMenu) -> Array[PopupMenu]:
	var new_submenus : Array[PopupMenu]
	var test_submenus : Array[Submenu]
	test_submenus.push_back(Submenu.new("Stuff1", _parent))
	test_submenus.push_back(Submenu.new("Stuff2", _parent))
	test_submenus.push_back(Submenu.new("Stuff3", _parent))
	test_submenus.push_back(Submenu.new("Stuff4", _parent))
	
	return new_submenus
