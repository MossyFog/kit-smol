@tool
extends Control

@onready var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
@onready var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	#size.x = viewport_width  #* $"../Camera2D".zoom
	#size.y = viewport_height #* $"../Camera2D".zoom
	pass


func _on_camera_2d_item_rect_changed() -> void:
	#size.x = viewport_width  #* $"../Camera2D".zoom
	#size.y = viewport_height #* $"../Camera2D".zoom
	pass
