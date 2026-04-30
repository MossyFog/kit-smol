# TODO: maybe-remove

class_name DResource
extends Resource

func _get(property: StringName) -> Variant:
	return self.duplicate()
