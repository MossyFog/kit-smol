extends CanvasLayer
## Main Canvas

@export var main_menu : Control
@export_custom(PROPERTY_HINT_DIR, "Node2D") var test : Node2D
@onready var viewport_width = ProjectSettings.get_setting(
	"display/window/size/viewport_width")
@onready var viewport_height = ProjectSettings.get_setting(
	"display/window/size/viewport_height")


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _on_camera_2d_item_rect_changed() -> void:
	pass


func _on_main_menu_button_pressed() -> void:
	main_menu.visible = true
