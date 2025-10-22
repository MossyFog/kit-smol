# Conversions
extends Node2D

func area_to_rigid(area2d : Area2D) -> RigidBody2D:
	# This silly lil thang converts Area2D to RigidBody2D
	
	var final := RigidBody2D.new() # Pre-purr-ation for rawr-gid body
	final.name = "rigid" # Setting name because meow
	
	# At this paw-oint we are gonna get the stuffies from one for the other.
	var childNodes := area2d.get_children() # Get stuffies
	final.transform = area2d.transform # Position-matchies
	# Looping through stuffies
	for i in childNodes:
		print("Adding: ", i.name, " to: ", final.name) # Debuggery
		i.reparent(final) # Stuffy transfer
	print_verbose(final) # Debuggery pt. II
	return final # Swats back the rigidbod wif stuffies
