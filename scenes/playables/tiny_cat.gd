extends Node2D

@export var myArea : Area2D
@export var myCamera : Camera2D
@export var scooch_right := Vector2(  8.0,   0.0)
@export var scooch_left  := Vector2( -8.0,   0.0)
@export var boop_up      := Vector2(  0.0, -18.5)
var rigid : RigidBody2D
var respawnTimer : Timer
var timeToRespawnAfterBoundary : float = 2.0
@onready var spawnPosition : Vector2 = self.position

# Built-in func
func _ready() -> void:
	rigid = Conversions.area_to_rigid(myArea)
	self.remove_child(myArea)
	myArea.queue_free()
	self.add_child(rigid)
	

func _process(delta: float) -> void:
	# Check inputs
	var pressing_left  : bool = Input.is_action_pressed("left")
	var pressing_right : bool = Input.is_action_pressed("right")
	var pressing_jump  : bool = Input.is_action_pressed("jump")
	var pressing_down  : bool = Input.is_action_pressed("down")
	var pressing_up    : bool = Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W)
	
	# Do inputs
	if (pressing_left):  #⬅️
		scooch(scooch_left)
	if (pressing_right): #➡️
		scooch(scooch_right)
	if (pressing_jump):  #⬆️
		scooch(boop_up)
	if (pressing_down):  #⬇️
		screech()
	
	# Ex-purr-iments, input, 001
	if (pressing_up):
		scooch(boop_up * 1.50)
	
	# Check stuff
	if (respawnTimer.timeout):
		respawn()
	

# Public func
func scooch(dir : Vector2) -> void:
	# Scooch
	rigid.apply_impulse(dir)


func screech() -> void:
	# Brakes / slow / stoppies
	pass


func respawn() -> void:
	self.position = spawnPosition


# Private func
func _start_respawn_timer() -> void:
	respawnTimer = Timer.new()
	respawnTimer.start(timeToRespawnAfterBoundary)


# Signals
func _on_area_2d_boundary_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	_start_respawn_timer()
	
