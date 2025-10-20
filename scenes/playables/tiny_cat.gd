extends Node2D

@export var myArea : Area2D
@export var myCamera : Camera2D
@export var scooch_right := Vector2(  8.0,   0.0)
@export var scooch_left  := Vector2( -8.0,   0.0)
@export var boop_up      := Vector2(  0.0, -18.5)
var rigid : RigidBody2D
var respawnTimer : Timer

func _ready() -> void:
	rigid = Conversions.area_to_rigid(myArea)
	self.remove_child(myArea)
	myArea.queue_free()
	self.add_child(rigid)

func _process(delta: float) -> void:
	var pressing_left  : bool = Input.is_action_pressed("left")
	var pressing_right : bool = Input.is_action_pressed("right")
	var pressing_jump  : bool = Input.is_action_pressed("jump")
	var pressing_down  : bool = Input.is_action_pressed("down")
	
	if (pressing_left):  #⬅️
		scooch(scooch_left)
	if (pressing_right): #➡️
		scooch(scooch_right)
	if (pressing_jump):  #⬆️
		scooch(boop_up)
	if (pressing_down):  #⬇️
		screech()
	
	# Ex-purr-iments, input, 001
	if (Input.is_action_pressed("ui_up") or Input.is_key_pressed(KEY_W)):
		scooch(boop_up * 1.50)
	

func scooch(dir : Vector2) -> void:
	# Scooch
	rigid.apply_impulse(dir)

func screech() -> void:
	# Brakes / slow / stoppies
	pass


func _on_area_2d_boundary_area_entered(area: Area2D) -> void:
	var time_until_respawn : float = 2.0
	
	respawnTimer = Timer.new()
	respawnTimer.start(time_until_respawn)
	
	


func _on_area_2d_boundary_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.
