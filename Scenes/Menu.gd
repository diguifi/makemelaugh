extends Node2D

@onready var animation = $AnimationPlayer

func _ready():
	animation.play("btn_happy")

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://Game.tscn")
