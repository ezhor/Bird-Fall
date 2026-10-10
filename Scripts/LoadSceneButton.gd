extends Button

@export var scene: PackedScene

func _on_button_down() -> void:
	get_tree().change_scene_to_packed(scene)
