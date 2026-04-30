extends Control
## Main Menu
@export var slider_test_1: SliderTest
@export var slider_test_2: SliderTest


func _ready() -> void:
	print("Connecting these: " + slider_test_1.name + " + " + slider_test_2.name)
	slider_test_1.h_slider.value_changed_2.connect(slider_test_2.gradient.on_h_slider_value_changed_2)
	slider_test_2.h_slider.value_changed_2.connect(slider_test_1.gradient.on_h_slider_value_changed_2)


func _process(_delta: float) -> void:
	pass


func _on_button_close_pressed() -> void:
	hide()
