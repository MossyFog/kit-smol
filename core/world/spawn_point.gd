extends Marker2D
## SpawnPoint

enum EntityType {
	PLAYER,
}

@export var entity_to_spawn : EntityType
var governing_respawnery : Respawnery


func _ready() -> void:
	if governing_respawnery.is_valid():
		pass
	
	
