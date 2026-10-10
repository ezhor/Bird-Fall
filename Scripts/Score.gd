extends Label
class_name Score

static var INSTANCE

var score: int

func _init() -> void:
	INSTANCE = self
	
func _ready() -> void:
	update_label()

func increase_score() -> void:
	score += 1
	update_label()	

func update_label() -> void:
	text = "Score: %d" % score
