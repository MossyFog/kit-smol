extends Node2D

@export var type : CollectableType

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	type.type = type.TYPE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
