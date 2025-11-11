# Rotatey Skew
@tool
extends Node

@export var spin : bool = false
@export_tool_button("SPINNY SPINNY!!!") var spinny = reset_skew
@export var spin_speed : float = 0.02
var new_skew : float = -89.0
@onready var parent : Node2D = get_parent()

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if (spin):
		new_skew = lerpf(parent.skew, 89.0, spin_speed)
		parent.skew = new_skew

func reset_skew() -> void:
	parent.skew = -89.0
