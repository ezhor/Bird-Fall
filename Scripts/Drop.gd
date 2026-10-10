extends Node2D

@export var speed: int
@export var destroy_limit: int

func _process(delta: float) -> void:
	position.y += speed * delta	
	if position.y > destroy_limit:
		queue_free()
