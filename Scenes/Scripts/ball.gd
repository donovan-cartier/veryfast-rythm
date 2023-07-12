extends Area2D
class_name Ball

@export var ball_default_location : Marker2D
@onready var animation_player := $AnimationPlayer
@onready var sprite := $Sprite2D

var next_location_marker = preload("res://Scenes/next_location_marker.tscn")
var next_location_marker_instance

var can_move : bool = false
var towards_player : bool = true
var next_location : Vector2

func _ready():
	next_location_marker_instance = next_location_marker.instantiate()
	GameManager.game_container.add_child.call_deferred(next_location_marker_instance)

func start_sequence():
	if towards_player:
		bounce_to_location(next_location, MusicManager.time_between_beats)
		animation_player.play("attack")
	else:
		bounce_to_location(ball_default_location.global_position)
		next_location_marker_instance.global_position = next_location
	
	towards_player = !towards_player

func bounce_to_location(location: Vector2, duration: float = .2, hit_player: bool = false):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", location, duration)
	
	if !hit_player:
		next_location = get_random_location()
		if location == ball_default_location.global_position:
			GameManager.camera.get_node("AnimationPlayer").play("shake")
	
func get_random_location():
	var viewport_size = GameManager.camera.get_viewport_rect().size
	return Vector2(randf_range(0, viewport_size.x), viewport_size.y - 16)

func _on_body_entered(body):
	if body is Player:
		bounce_to_location(ball_default_location.global_position, .2, true)
		hit()
		
func hit():
	var tween: Tween = create_tween()
	tween.tween_property(sprite, "modulate:v", 1, 0.3).from(15)
	animation_player.play("hit")
