extends TextureRect

func _on_h_slider_value_changed(value: float) -> void:
	var c = texture.curve as Curve
	var new_point_x = (c.get_point_position(0).x + value) / 16
	c.set_point_value(0, new_point_x)

func _on_h_slider_value_changed_2(value: float) -> void:
	var c = texture.curve as Curve
	var new_point_x = (c.get_point_position(1).x + value) / 16
	c.set_point_value(1, new_point_x)
