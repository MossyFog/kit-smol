# Sprite
extends AnimatedSprite2D
var counter : int = 1

func _ready() -> void:
	print("Sprite: Ready #", counter)
	counter += 1

func _enter_tree() -> void:
	print("Sprite: Entered Tree #", counter)
	counter += 1

func _process(_delta: float) -> void:
	pass
