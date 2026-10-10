extends Node2D

@export var drop_time: float
@export var drop: PackedScene

var timer: Timer

func _ready() -> void:
	create_timer()

func _on_timeout() -> void:
	var instance = drop.instantiate() as Node2D
	add_child(instance)
	instance.position.x = randf_range(Constants.MIN_POSITION, Constants.MAX_POSITION)
	
func create_timer() -> void:
	timer = Timer.new()
	timer.wait_time = drop_time
	timer.timeout.connect(_on_timeout)
	add_child(timer)
	timer.start()
