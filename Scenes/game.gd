extends Node2D


# Called when the node entersthe scene tree for the first time.
func _ready():
	GameManager.refresh_nodes()
	await get_tree().create_timer(MusicManager.sound_offset).timeout
#	MusicManager.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
