extends Area2D

@export var ball_default_location : Marker2D

var can_move : bool = false

func _ready():
	bounce_to_location(get_random_location())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move:
		pass

func _on_area_2d_body_entered(body):
	if body is Player:
		bounce_to_spawn()

func bounce_to_spawn():
	can_move = false
	
func bounce_to_location(location: Vector2):
	var tween = get_tree().create_tween()
	tween.tween_property(self)
	print(location)
	
func get_random_location():
	var viewport_size = GameManager.camera.get_viewport_rect().size
	return Vector2(randf_range(0, viewport_size.x), 0)
