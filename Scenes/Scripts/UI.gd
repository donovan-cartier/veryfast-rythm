extends Control

@onready var current_rank : TextureRect = $CurrentRank
@onready var animation_player = $CurrentRank/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	$StartScreen.visible = false

func update_rank(new_rank : String):
	if new_rank == "NONE":
		current_rank.texture = null;
	else:
		current_rank.texture = load("res://Assets/Sprites/ranks/rank_" + new_rank.to_lower() + ".png")
		animation_player.play("rank_up")
