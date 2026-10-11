extends Label
class_name Score

@export var audio: AudioStreamPlayer2D

const SAVE_PATH: String = "user://max_score.save"

static var INSTANCE: Score
static var score: int
static var max_score: int

func _init() -> void:
	INSTANCE = self
	score = 0
	
func _ready() -> void:
	update_label()

func increase_score() -> void:
	score += 1
	audio.play()
	update_label()

func update_label() -> void:
	text = "Score: %d" % score

static func update_max_score() -> void:
	max_score = max(score, max_score, load_max_score())
	save_max_score()

static func load_max_score() -> int:
	var stored_score = 0
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			stored_score = file.get_var()
			file.close()
	return stored_score

static func save_max_score() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_var(max_score)
		file.close()
	
