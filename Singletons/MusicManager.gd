extends Node

var BPM : float = 120.0
var time_between_beats = 60 / BPM
var sound_offset: float = 0

func on_new_beat():
	print("BEAT")
	GameManager.ball.start_sequence()
	GameManager.shader_animator.play("flash")
	GameManager.player.get_node("AnimationPlayer").play("beat")
	await get_tree().create_timer(time_between_beats).timeout
	on_new_beat()
