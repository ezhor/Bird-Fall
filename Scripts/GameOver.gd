extends Node2D

@export var max_score_label: Label
@export var score_label: Label

func _ready() -> void:
	Score.update_max_score()
	max_score_label.text = "Max score\n%d" % Score.max_score
	score_label.text = "Your score\n%d" % Score.score
