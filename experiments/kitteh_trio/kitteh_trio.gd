extends Node2D

@export var line_color : Color = Color.VIOLET
@export var line_width : float = 2.0
@export var points : Array[RigidBody2D]

func _ready() -> void:
	pass

func _draw() -> void:
	##TODO iterator/index stuff + this is incomplete/untested
	#for point in points:
		#if ((points[point] != points[0]) and (points[point] != points[1])):
			#draw_line(points[point].position, points[point].position,
				#line_color, line_width)
		#elif points[point] != points[1]:
			#draw_line(points[0].position, points[1].position,
				#line_color, line_width)
		#else:
			#continue
	pass

func _process(_delta: float) -> void:
	queue_redraw()
