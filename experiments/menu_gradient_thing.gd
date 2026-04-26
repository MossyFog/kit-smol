extends TextureRect

enum AXIS {
	x,
	y
}

## Changes that... thing... >.>
func change_that_thing(point: int, axis: AXIS, value: float) -> void:
	var curve = texture.curve as Curve
	var target : float
	if axis == AXIS.x:
		target = curve.get_point_position(point).x
	elif axis == AXIS.y:
		target = curve.get_point_position(point).y
	
	var new_point = (target + value) / 16
	curve.set_point_value(point, new_point)


func _on_h_slider_value_changed(value: float) -> void:
	change_that_thing(0, AXIS.x, value)

func _on_h_slider_value_changed_2(value: float) -> void:
	change_that_thing(1, AXIS.x, value)
