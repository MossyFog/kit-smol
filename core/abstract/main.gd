extends Node
## Main ; KIT SMOL

@export_category("Main Game")
## Main CanvasLayer for UI, HUD, etc.
@export var main_canvas : CanvasLayer
## Main Node2D for other Node2D stuff.
@export var main_node_2d : Node2D


func _init() -> void:
	print_debug("Main initializing(_init)")


func _enter_tree() -> void:
	print_debug("Main entering tree(_enter_tree)")


func _exit_tree() -> void:
	print_debug("Main exiting tree(_exit_tree)")


func _ready() -> void:
	print_debug("Main ready(_ready)")


func _process(_delta: float) -> void:
	pass
