class_name NodeThrower
extends Respawnery
## Launcher

@export_group("Launch Stuff", "launch")
@export var launch_item      : PackedScene
@export var launch_direction : Vector2
@export var launch_pulse     : float = 1.0
@export var launch_delay     : float = 0.0
@export_range(-360.0, 360.0, 0.1, "degrees") var launch_rotation : float

@onready var launching : bool = false

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

func launch() -> void:
	await get_tree().create_timer(launch_delay).timeout
	if launching == false:
		var item = launch_item.instantiate()
		add_sibling(item)
		
		if (launch_item.resource_path == "res://experiments/kitteh_trio/kitteh_trio.tscn"):
			item.points[0].apply_central_impulse(launch_direction * launch_pulse)
		else:
			item.apply_central_impulse(launch_direction * launch_pulse)
		
		launching = true
	await get_tree().create_timer(launch_delay).timeout
	launching = false
