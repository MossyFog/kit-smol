@icon("res://assets/cc0/tinycat_kirisoft/tinycat11x11.png")
class_name TinyCat extends Node2D

@export var myArea : Area2D
@export var myCamera : Camera2D
@export var scooch_right := Vector2(  8.0,   0.0)
@export var scooch_left  := Vector2( -8.0,   0.0)
@export var boop_up      := Vector2(  0.0, -18.5)
var rigid : RigidBody2D
var respawnTimer : Timer
var timeToRespawnAfterBoundary : float = 2.0
@onready var spawnPosition : Vector2 = self.position
@onready var lockspot := StaticBody2D.new()
@onready var springjoint := DampedSpringJoint2D.new()
var _tether_is_bound : bool

# Built-in func 
# 🌟
func _ready() -> void:
	# For no good reason converting... :3
	rigid = Conversions.area_to_rigid(myArea)
	remove_child(myArea)
	myArea.queue_free()
	add_child(rigid)
	# Tether/spring/joint
	tether_manifest()
	

# ⚙️
func _process(delta: float) -> void:
	# Check inputs ⌨️
	var pressing_left  : bool = Input.is_action_pressed("left")
	var pressing_right : bool = Input.is_action_pressed("right")
	var pressing_jump  : bool = Input.is_action_pressed("jump")
	var pressing_down  : bool = Input.is_action_pressed("down")
	var pressing_up    : bool = Input.is_key_pressed(KEY_W)
	var released_up    : bool = Input.is_action_just_released("down")
	
	# Do inputs 🎬
	if (pressing_left):  #⬅️
		scooch(scooch_left)
	if (pressing_right): #➡️
		scooch(scooch_right)
	if (pressing_jump):  #⬆
		scooch(boop_up)
	if (pressing_down):  #⬇️
		screech()
		tether_bind(springjoint, lockspot, rigid)
	if(released_up):     #🛑⬆️
		tether_cut(springjoint)
	if (pressing_up):    #⬆️⬆
		scooch(boop_up * 1.50)
	

func _draw() -> void:
	draw_circle(rigid.position, 5.0, Color.ORANGE_RED, false, 2.0, true)
	draw_circle(springjoint.position, 5.0, Color.YELLOW, false, 2.0, true)
	draw_circle(lockspot.position, 5.0, Color.RED, false, 2.0, true)
	

# Public func
# 🛞
func scooch(dir : Vector2) -> void:
	# Scooch
	rigid.apply_impulse(dir)

# 🛑
func screech() -> void:
	# Brakes / slow / stoppies
	pass

# ⛓️
func tether_manifest() -> void:
	lockspot = StaticBody2D.new()
	springjoint = DampedSpringJoint2D.new()
	springjoint.length = 50.0
	springjoint.stiffness = 20.0
	lockspot.position = rigid.position
	draw_circle(rigid.position, 5.0, Color.ORANGE_RED, false, 2.0, true)
	add_child(lockspot)
	add_child(springjoint)
	print("tether manifested")

# 🔗
func tether_bind(tether : Joint2D, a : PhysicsBody2D, b : PhysicsBody2D) -> void:
	if (_tether_is_bound == false):
		print("tether not bound (tether_bind)")
		tether.process_mode = Node.PROCESS_MODE_INHERIT
		tether.node_a = get_path_to(a)
		tether.node_b = get_path_to(b)
		_tether_is_bound = true
	else:
		print("tether is bound (tether_bind)")

# ⛓️‍💥
func tether_cut(tether : Joint2D) -> void:
	print("Cutting tether (tether_cut)")
	tether.process_mode = Node.PROCESS_MODE_DISABLED
	#tether.node_a = null
	#tether.node_b = null

# ⚡
func respawn() -> void:
	print("Respawning...")
	self.position = spawnPosition


# Private func
# ⏳
func _start_respawn_timer() -> void:
	respawnTimer = Timer.new()
	respawnTimer.timeout.connect(_on_respawn_timer_timeout)
	respawnTimer.start(timeToRespawnAfterBoundary)


# Signals
# ⛔
func _on_area_2d_boundary_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	_start_respawn_timer()
	

#⌛
func _on_respawn_timer_timeout() -> void:
	respawn()
