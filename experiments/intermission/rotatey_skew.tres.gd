# Rotatey Skew
@tool
extends Node

@export_tool_button("SPINNY SPINNY!!!") var spinny = reset_skew
@export var speed_idk : float = 0.02

var new_skew : float = -89.0

@onready var parent : Node2D = get_parent()


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	new_skew = lerpf(parent.skew, 89.0, speed_idk)
	parent.skew = new_skew
	$"../../LabelSpinny".rotation = new_skew
	$"../../LabelSpinny2".rotation = new_skew

func reset_skew() -> void:
	parent.skew = -89.0
	$"../../LabelSpinny".rotation = -89.0
	$"../../LabelSpinny2".rotation = -89.0
