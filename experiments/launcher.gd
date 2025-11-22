extends Node2D
## Launcher

@export_group("Launch Stuff", "launch")
@export var launch_item      : PackedScene
@export var launch_direction : Vector2
@export var launch_pulse     : Vector2
@export_range(-360.0, 360.0, 0.1, "degrees") var launch_rotation : float


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
