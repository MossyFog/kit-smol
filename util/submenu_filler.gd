class_name SubmenuFiller
extends PopupMenu

var test_submenus : Array[Submenu]

func _ready() -> void:
	pass

static func fill_submenus(submenus : Array[Submenu], _parent: PopupMenu) -> Array[PopupMenu]:
	var new_submenus : Array[PopupMenu]
	submenus.push_back(Submenu.new("First", _parent))
	#submenus = populate_submenus(submenus[0])
	for i in submenus:
		i.add_submenu_node_item(i.name_menu, i)
		#var subsubmenus = populate_submenus(submenus[i])
		#for j in subsubmenus:
			#i.add_submenu_node_item(j.name, j)
			#var subsubsubmenus = populate_submenus(subsubmenus[j])
			#for k in subsubsubmenus:
				#j.add_submenu_node_item(k.name, k)
		#lbl.text = (lbl.text + "\n" + str(i.name) + " added.")
	
	return new_submenus

static func populate_test_submenus(_parent: PopupMenu) -> Array[Submenu]:
	var test_submenus : Array[Submenu] = [
		Submenu.new("Stuff1", _parent),
		Submenu.new("Stuff2", _parent),
		Submenu.new("Stuff3", _parent),
		Submenu.new("Stuff4", _parent),
	]
	return test_submenus
