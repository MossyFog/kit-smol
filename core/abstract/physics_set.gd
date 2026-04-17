class_name PhysicsSet extends Node

var interpolation : PhysicsInterpolationMode
var material : PhysicsMaterial

#var audio : AudioStreamPlayer.

var default : PhysicsSet

class Default extends PhysicsSet:
	func _init() -> void:
		interpolation = PHYSICS_INTERPOLATION_MODE_INHERIT
		
		material.absorbent = false
		material.bounce = 0.0
		material.friction = 1.0
		material.rough = false
		
		default = self
