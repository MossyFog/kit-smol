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
		# Detach and reattach signals
		for siglist in i.get_signal_list() as Array[Dictionary]:
			for sig in siglist as Dictionary:
				if has_signal(sig):
					print_verbose(siglist[sig])
					var signame = String(siglist[sig])
					if (has_connections(signame)):
						for connection in get_signal_connection_list(signame) as Array[Dictionary]:
							for incoming_connection in connection as Dictionary:
								# AHHHHHHHH ~ Vol. II
								var ic_signame : StringName = incoming_connection["signal"]
								var ic_callable : Callable = incoming_connection["callable"]
								var ic_flags : ConnectFlags = incoming_connection["flags"]
								final.connect(ic_signame, ic_callable, ic_flags)
								# psst: 'final' is the new parent node fyi
					else:
						pass # else no connections
				
			
		
		print("Adding: ", i.name, " to: ", final.name) # Debuggery
		i.reparent(final) # Stuffy transfer
	print_verbose(final) # Debuggery pt. II
	return final # Swats back the rigidbod wif stuffies
