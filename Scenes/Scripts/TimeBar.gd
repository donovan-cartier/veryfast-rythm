extends TextureProgressBar

@onready var song_length = GameManager.audio_player.stream.get_length()

func _on_bgm_player_beat():
	value = (GameManager.audio_player.get_playback_position() / song_length) * 100
