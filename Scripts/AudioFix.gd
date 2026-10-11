extends AudioStreamPlayer2D

func _input(event):
	if event is InputEventScreenTouch and event.pressed and not playing:
			play()
