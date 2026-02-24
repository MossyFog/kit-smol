# Collectable
extends Node2D

signal send_fuel
@export var type : CollectableType
@export var value : float = 0


func _ready() -> void:
	pass


func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	emit_signal("send_fuel")
	$KittyCollect/RotateySkew.reset_skew()
	
