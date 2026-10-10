extends Area2D

@export var speed: int
@export var destroy_limit: int
@export var glow_delay: float
@export var glow: Sprite2D
@export var sprite: Sprite2D
@export var leaf_sprites: Array[Texture2D]
@export var colors: Array[Color]

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	set_leaf()
	start_rotation_tween()
	start_glow_tween()
	
func set_leaf() -> void:
	var i = randi_range(0, leaf_sprites.size() - 1)
	sprite.texture = leaf_sprites[i]
	glow.modulate = colors[i]
	sprite.rotation_degrees = randf_range(0, 360)

func start_rotation_tween():
	var tween = create_tween().set_loops()
	tween.tween_property(sprite, "rotation_degrees", sprite.rotation_degrees + 180, 1.0)
	tween.chain().tween_property(sprite, "rotation_degrees", sprite.rotation_degrees + 360, 1.0)

func start_glow_tween():
	var tween = create_tween().set_loops()
	var color = glow.modulate
	color.a = 0
	tween.tween_property(glow, "modulate", color, glow_delay)
	color.a = 1
	tween.chain().tween_property(glow, "modulate", color, glow_delay)

func _process(delta: float) -> void:
	position.y += speed * delta
	if position.y > destroy_limit:
		queue_free()

func _on_area_entered(body: Node2D) -> void:
	if body.name == "Player":
		queue_free()
