extends Label
class_name Score

static var INSTANCE

var score: float

func _init() -> void:
	INSTANCE = self

func increase_score() -> void:
	score += 1
	text = "Score: %d" % score
