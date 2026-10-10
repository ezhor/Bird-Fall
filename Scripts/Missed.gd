extends Label
class_name Missed

@export var max_missed: int
@export var game_over_scene: PackedScene

static var INSTANCE: Missed

var missed: int

func _init() -> void:
	INSTANCE = self
	
func _ready() -> void:
	update_label()

func increase_missed() -> void:
	missed += 1
	update_label()
	if missed >= max_missed:
		get_tree().change_scene_to_packed(game_over_scene)

func update_label() -> void:
	text = "Missed: %d/%d" % [missed, max_missed]
