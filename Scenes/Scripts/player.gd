extends CharacterBody2D
class_name Player

const SPEED = 300.0

var ranks = [
	"NONE",
	"OKAY",
	"GOOD",
	"GREAT",
	"AMAZING",
	"INSANE",
	"TERRIFIC",
	"SCARY",
	"WOW"
]

var health: float = 100.0

var current_multiplier : int = 0
var current_rank_index : int = 0

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
	reset_multiplier()
	if health <= 0:
		print('die')

func add_multiplier():
	current_multiplier += 1
	GameManager.ui_current_multiplier.text = "x" + str(current_multiplier)
	
	add_rank()

func reset_multiplier():
	current_multiplier = 0
	current_rank_index = 0
	GameManager.ui_current_multiplier.text = ''
	GameManager.ui_container.update_rank(ranks[current_rank_index])

func add_rank():
	if current_multiplier == 0:
		current_rank_index = 0
	elif current_multiplier < 3:
		current_rank_index = 1
	elif current_multiplier < 6:
		current_rank_index = 2
	elif current_multiplier < 10:
		current_rank_index = 3
	elif current_multiplier < 15:
		current_rank_index = 4
	elif current_multiplier < 18:
		current_rank_index = 5
	elif current_multiplier < 22:
		current_rank_index = 6
	elif current_multiplier < 28:
		current_rank_index = 7
	else:
		current_rank_index = 8
		
	GameManager.ui_container.update_rank(ranks[current_rank_index])
	
func _on_bgm_player_beat():
	$AnimationPlayer.play("beat")
	GameManager.shader_animator.play("flash")
