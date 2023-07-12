extends Node

@onready var game_container : Node2D = get_tree().get_root().get_node("Game")
@onready var camera : Camera2D = game_container.get_node("Camera2D")
@onready var canvas_layer : CanvasLayer = game_container.get_node("CanvasLayer")
@onready var screen_shader : ColorRect = canvas_layer.get_node("ScreenShader")
@onready var shader_animator : AnimationPlayer = screen_shader.get_node("ShaderAnimator")
@onready var ball : Ball = game_container.get_node("EyeBall")
@onready var player : Player = game_container.get_node("Player")
