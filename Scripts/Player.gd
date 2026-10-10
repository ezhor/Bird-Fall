extends Node2D

func _process(_delta: float) -> void:
	var mouse_position: float = get_viewport().get_mouse_position().x
	position.x = clamp(mouse_position, Constants.MIN_POSITION, Constants.MAX_POSITION)
