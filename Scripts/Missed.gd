extends Label
class_name Missed

@export var max_missed: int

static var INSTANCE

var missed: int

func _init() -> void:
	INSTANCE = self
	
func _ready() -> void:
	update_label()

func increase_missed() -> void:
	missed += 1	
	update_label()

func update_label() -> void:
	text = "Missed: %d/%d" % [missed, max_missed]
