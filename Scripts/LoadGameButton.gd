extends Button

const game_scene_path: String = "res://Scenes/game.tscn"

func _on_button_down() -> void:
	(func(): get_tree().change_scene_to_file(game_scene_path)).call_deferred()
