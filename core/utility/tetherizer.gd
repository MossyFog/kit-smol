class_name Tetherizer extends Node2D
## Tetherizer

@export var tether_target : Node2D

@onready var springjoint : DampedSpringJoint2D = $Springjoint ## Spring joint.

@onready var lockbody: StaticBody2D = $StaticBody2D ## Locked body to connect joint to.


func _ready() -> void:
	align()
	if (tether_target == null):
		print_debug("Tether terget null; attaching to parent node.")
		tether_target = get_parent()


func _process(_delta: float) -> void:
	pass

## ⛓️
func tether_manifest() -> void:
	align()
	springjoint.length = 10.0
	springjoint.stiffness = 50.0

## 🔗
func tether_bind() -> void:
	align()
	springjoint.node_a = get_path_to(lockbody)
	springjoint.node_b = get_path_to(tether_target)

## ⛓️‍💥 This should disable/deactivate the tether, basically
func tether_cut() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	springjoint.node_a = ""

func match_pos(target: Node2D, to_match: Node2D) -> void:
	target.position = to_match.position

func align() -> void:
	## Match Tetherizer's position to the body that stays still
	match_pos(tether_target, lockbody)
	## Match the Springjoint to the Tetherizer's position
	match_pos(springjoint, tether_target)
