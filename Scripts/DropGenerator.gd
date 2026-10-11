extends Node2D

@export var drop_start_time: float
@export var drop_end_time: float
@export var difficulty_increase_time: float
@export_range(0,1) var diffculty_increase: float
@export var drop: PackedScene

var current_time: float

var drop_timer: Timer
var difficulty_timer: Timer

func _ready() -> void:
	create_drop_timer()
	create_difficulty_timer()

func _on_drop() -> void:
	var instance: Node2D = drop.instantiate()
	add_child(instance)
	instance.position.x = randf_range(Constants.MIN_POSITION, Constants.MAX_POSITION)	
	
func create_drop_timer() -> void:
	current_time = drop_start_time
	drop_timer = Timer.new()
	drop_timer.wait_time = current_time
	drop_timer.timeout.connect(_on_drop)
	add_child(drop_timer)
	drop_timer.start()
	
func _on_difficulty_increase() -> void:
	current_time -= (drop_start_time - drop_end_time) * diffculty_increase
	if current_time < drop_end_time:
		current_time = drop_end_time
		difficulty_timer.stop()
	drop_timer.wait_time = current_time

func create_difficulty_timer() -> void:
	difficulty_timer = Timer.new()
	difficulty_timer.wait_time = difficulty_increase_time
	difficulty_timer.timeout.connect(_on_difficulty_increase)
	add_child(difficulty_timer)
	difficulty_timer.start()
