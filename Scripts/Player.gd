extends Node2D

func _process(_delta: float) -> void:
	position.x = get_viewport().get_mouse_position().x
