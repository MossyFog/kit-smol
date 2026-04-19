extends HSlider

signal value_changed_2
@onready var label_val: Label = $"../HBoxContainer/LabelVal"

func _ready() -> void:
	pass

func _on_value_changed(value: float) -> void:
	label_val.text = str(value)
	value_changed_2.emit(value)
