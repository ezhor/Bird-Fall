extends Area2D

@export_group("Config")
@export var speed: int
@export var destroy_limit: int
@export_range(0, 100) var snowflake_probability
@export var game_over_scene: PackedScene

@export_group("Glow")
@export var glow_delay: float
@export var glow: Sprite2D

@export_group("Sprites")
@export var sprite: Sprite2D
@export var leaves_textures: Array[Texture2D]
@export var leaves_colors: Array[Color]
@export var snowflake_texture: Texture2D
@export var snowflake_color: Color

var snowflake_mode: bool

func _ready() -> void:
	snowflake_mode = randi_range(0,100) < snowflake_probability
	area_entered.connect(_on_area_entered)
	set_texture()
	start_rotation_tween()
	start_glow_tween()
	
func set_texture() -> void:
	if snowflake_mode:
		sprite.texture = snowflake_texture
		glow.modulate = snowflake_color
	else:
		var i: int = randi_range(0, leaves_textures.size() - 1)
		sprite.texture = leaves_textures[i]
		glow.modulate = leaves_colors[i]

func start_rotation_tween():
	var tween: Tween = create_tween().set_loops()
	sprite.rotation_degrees = randf_range(0, 360)
	tween.tween_property(sprite, "rotation_degrees", sprite.rotation_degrees + 180, 1.0)
	tween.chain().tween_property(sprite, "rotation_degrees", sprite.rotation_degrees + 360, 1.0)

func start_glow_tween():
	var tween: Tween = create_tween().set_loops()
	var color: Color = glow.modulate
	color.a = 0
	tween.tween_property(glow, "modulate", color, glow_delay)
	color.a = 1
	tween.chain().tween_property(glow, "modulate", color, glow_delay)

func _process(delta: float) -> void:
	position.y += speed * delta
	if position.y > destroy_limit:
		queue_free()
		if not snowflake_mode:
			Missed.INSTANCE.increase_missed()

func _on_area_entered(body: Node2D) -> void:
	if body.name == "Player":
		if snowflake_mode:
			(func(): get_tree().change_scene_to_packed(game_over_scene)).call_deferred()
		else:
			Score.INSTANCE.increase_score()
			queue_free()
