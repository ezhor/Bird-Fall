extends CharacterBody2D

@export var gravity: float
@export var terminal_speed: float
@export var horizontal_speed: float
@export var flying_acceleration: float
@export var flying_top_speed: float

var flying: bool

func _ready() -> void:
	velocity.x = horizontal_speed

func _physics_process(delta: float) -> void:
	if flying:
		if velocity.y > 0:
			velocity.y = 0
		velocity.y -= flying_acceleration * delta
	else:
		velocity.y += gravity * delta
	
	if velocity.y > terminal_speed:
		velocity.y = terminal_speed
	elif velocity.y < -flying_top_speed:
		velocity.y = -flying_top_speed
		
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				flying = true
			elif event.is_released():
				flying = false
