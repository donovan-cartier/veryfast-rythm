extends Node2D


# Called when the node entersthe scene tree for the first time.
func _ready():
	MusicManager.on_new_beat()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
