extends Node2D

@export var branch : PackedScene

func _ready() -> void:
	for i in 10:
		var instance = branch.instantiate()
		add_child(instance)
		instance.global_position = Vector2(i * 300, randi_range(100, 700))
