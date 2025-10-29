# If Hidden NVM
extends Node2D

func _ready() -> void:
	if(hidden):
		for i in get_children():
			i.queue_free()

func _process(delta: float) -> void:
	pass
