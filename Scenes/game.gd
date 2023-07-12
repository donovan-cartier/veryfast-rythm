extends Node2D


# Called when the node entersthe scene tree for the first time.
func _ready():
	GameManager.audio_player.play()
	await get_tree().create_timer(MusicManager.sound_offset).timeout
	MusicManager.on_new_beat()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
