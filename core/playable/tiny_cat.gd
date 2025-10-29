# Tiny Cat
@icon("res://assets/cc0/tinycat_kirisoft/tinycat11x11.png")
class_name TinyCat extends Node2D
## Tiny Cat is KIT SMOL[br]
## Isn't that meow?

signal spend_fuel(cost : float) ## Spend fuel.

@export var myArea : Area2D ## Caution: Get's turned into 'rigid'.
@export var myCamera : Camera2D ## Camera to follow.
@export var scooch_right := Vector2(  8.0,   0.0) ## Scooches right.
@export var scooch_left  := Vector2( -8.0,   0.0) ## Scooches left.
@export var boop_up      := Vector2(  0.0, -18.5) ## Boops up.

var rigid : RigidBody2D ## Replaces myArea.
var respawnTimer : Timer ## Timer until respawn.
var timeToRespawnAfterBoundary : float = 2.0 ## Time to respawn after crossing
## world boundary.
var fuel_cost : float = 0.05 ## Cost of fuel.
#var _tether_is_bound : bool ## Determines if tether is bound.

@onready var tetherizer: Node2D = $Tetherizer ## Tetherizer
@onready var startPos : Vector2 ## Initial start position.
@onready var spawnPosition : Vector2 = self.position ## Where to spawn.
#@onready var lockspot := StaticBody2D.new() ## Locked body to connect joint to.
#@onready var springjoint := DampedSpringJoint2D.new() ## Spring joint.

# Built-in func 
## 🌟
func _ready() -> void:
	## For no good reason converting... :3
	rigid = Conversions.area_to_rigid(myArea)
	remove_child(myArea)
	myArea.queue_free()
	add_child(rigid)
	# Tether/spring/joint
	tetherizer.tether_manifest()
	startPos = rigid.position
	

## ⚙️
func _process(_delta: float) -> void:
	# Check inputs ⌨️
	var pressing_left  : bool = Input.is_action_pressed("left")
	var pressing_right : bool = Input.is_action_pressed("right")
	var pressing_down  : bool = Input.is_action_pressed("down")
	var pressing_up    : bool = Input.is_action_pressed("up")
	var released_up : bool = Input.is_action_just_released("down")
	var pressing_jump  : bool = Input.is_action_pressed("jump")
	var scroll_up      : bool = Input.is_action_pressed("scroll_up")
	var scroll_down    : bool = Input.is_action_pressed("scroll_down")
	
	# Do inputs 🎬
	if (pressing_left):  #⬅️
		scooch(scooch_left)
	if (pressing_right): #➡️
		scooch(scooch_right)
	if (pressing_jump):  #⬆
		scooch(boop_up)
	if Input.is_action_just_pressed("down"):
		tetherizer.tether_bind(tetherizer.springjoint, tetherizer.lockbody, rigid)
	if (pressing_down):  #⬇️
		screech()
	if(released_up):     #🛑⬆️
		tetherizer.tether_cut(tetherizer.springjoint)
	if (pressing_up):    #⬆️⬆
		scooch(boop_up * 1.50)
	if (scroll_up):
		print("scrollyup")
		myCamera.zoom += Vector2(0.1, 0.1)
	if (scroll_down):
		print("scrollydown")
		myCamera.zoom -= Vector2(0.1, 0.1)
	
	queue_redraw()

func _draw() -> void:
	draw_line(tetherizer.lockbody.position, rigid.position, Color.RED, 1.2)
	
	draw_circle(rigid.position,       5.0, Color.ORANGE_RED, false, 2.0, true)
	draw_circle(tetherizer.springjoint.position, 5.0, Color.BLUE, false, 2.0, true)
	draw_circle(tetherizer.lockbody.position,    5.0, Color.GREEN, false, 2.0, true)
	


# Public func
## 🛞
func scooch(dir : Vector2) -> void:
	# Scooch
	rigid.apply_impulse(dir)
	emit_signal("spend_fuel", fuel_cost)

## 🛑
func screech() -> void:
	# Brakes / slow / stoppies
	pass




## ⚡
func respawn() -> void:
	print("Respawning...")
	self.position = spawnPosition


# Private func
## ⏳
func _start_respawn_timer() -> void:
	respawnTimer = Timer.new()
	respawnTimer.timeout.connect(_on_respawn_timer_timeout)
	add_child(respawnTimer)
	respawnTimer.start(timeToRespawnAfterBoundary)


# Signals
## ⛔
func _on_area_2d_boundary_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	#if (body == $"Area2D2"):
		#print(body, " has collided.")
		#_start_respawn_timer()
	pass
	

##⌛
func _on_respawn_timer_timeout() -> void:
	respawn()


func _on_collectable_send_fuel() -> void:
	emit_signal("spend_fuel", fuel_cost * -190.0)
