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
var _tether_is_bound : bool ## Determines if tether is bound.

@onready var startPos : Vector2 ## Initial start position.
@onready var spawnPosition : Vector2 = self.position ## Where to spawn.
@onready var lockspot := StaticBody2D.new() ## Locked body to connect joint to.
@onready var springjoint := DampedSpringJoint2D.new() ## Spring joint.

# Built-in func 
## 🌟
func _ready() -> void:
	## For no good reason converting... :3
	rigid = Conversions.area_to_rigid(myArea)
	remove_child(myArea)
	myArea.queue_free()
	add_child(rigid)
	# Tether/spring/joint
	tether_manifest()
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
		tether_bind(springjoint, lockspot, rigid)
	if (pressing_down):  #⬇️
		screech()
	if(released_up):     #🛑⬆️
		tether_cut(springjoint)
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
	draw_line(lockspot.position, rigid.position, Color.RED, 1.2)
	
	draw_circle(rigid.position,       5.0, Color.ORANGE_RED, false, 2.0, true)
	draw_circle(springjoint.position, 5.0, Color.BLUE, false, 2.0, true)
	draw_circle(lockspot.position,    5.0, Color.GREEN, false, 2.0, true)
	


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

## ⛓️
func tether_manifest() -> void:
	lockspot = StaticBody2D.new()
	lockspot.position = rigid.position
	var circle = CircleShape2D.new()
	
	lockspot.shape_owner_add_shape(1, circle)
	
	springjoint = DampedSpringJoint2D.new()
	springjoint.position = rigid.position
	springjoint.length = 10.0
	springjoint.stiffness = 50.0
	
	add_child(lockspot)
	add_child(springjoint)
	
	print("tether manifested")
	

## 🔗
func tether_bind(tether : Joint2D, a : PhysicsBody2D, b : PhysicsBody2D) -> void:
	if (_tether_is_bound == false):
		springjoint.position = rigid.position
		lockspot.position = rigid.position
		print("tether not bound (tether_bind)")
		tether.process_mode = Node.PROCESS_MODE_INHERIT
		tether.node_a = get_path_to(a)
		tether.node_b = get_path_to(b)
		_tether_is_bound = true
	else:
		print("tether is bound (tether_bind)")

## ⛓️‍💥
func tether_cut(tether : Joint2D) -> void:
	print("Cutting tether (tether_cut)")
	tether.process_mode = Node.PROCESS_MODE_DISABLED
	# Disconnect all nodes... somehow.. hmmmm
	#tether.node_a = get_path_to(self)
	#tether.node_b = get_path_to(self)
	remove_child($"tether.node_a")
	remove_child($"tether.node_b")


## ⚡
func respawn() -> void:
	print("Respawning...")
	self.position = spawnPosition


# Private func
## ⏳
func _start_respawn_timer() -> void:
	respawnTimer = Timer.new()
	respawnTimer.timeout.connect(_on_respawn_timer_timeout)
	respawnTimer.start(timeToRespawnAfterBoundary)


# Signals
## ⛔
func _on_area_2d_boundary_body_shape_entered(_body_rid: RID, _body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	_start_respawn_timer()
	

##⌛
func _on_respawn_timer_timeout() -> void:
	respawn()


func _on_collectable_send_fuel() -> void:
	emit_signal("spend_fuel", fuel_cost * -190.0)
