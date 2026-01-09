class_name NodeThrower
extends Respawnery
## Launcher

@export_group("Launch Stuff", "launch")
@export var launch_item      : Resource
@export var launch_direction : Vector2
@export var launch_pulse     : float = 1.0
@export var launch_delay     : float = 0.0
@export_range(-360.0, 360.0, 0.1, "degrees") var launch_rotation : float


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass
