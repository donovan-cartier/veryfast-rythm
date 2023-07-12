extends CharacterBody2D
class_name Player

const SPEED = 300.0
var health: float = 100.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	velocity.y = 0
	move_and_slide()

func damage(amount: float):
	health -= amount
	GameManager.ui_health_bar.value = health
	if health <= 0:
		print('die')
