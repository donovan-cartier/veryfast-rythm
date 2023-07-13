extends AudioStreamPlayer

var timeSinceLastBeat: float = 0.0
var beatDuration: float = .5
var lastBeatTime: float = 0.0

signal beat

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var currentTime = get_playback_position()
	if currentTime >= lastBeatTime + beatDuration:
		GameManager.ball.sound_player_blip.play()
		emit_signal("beat")
		lastBeatTime += beatDuration
#	timeSinceLastBeat += delta
#	if timeSinceLastBeat >= beatDuration:
#		timeSinceLastBeat = 0
#		GameManager.ball.sound_player_blip.play()



func _on_play_button_pressed():
	play()
