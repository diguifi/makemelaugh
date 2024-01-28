extends Node2D

@onready var animation = $AnimationPlayer
@onready var pop = $Bubble

func _ready():
	animation.play("btn_happy")

func _on_texture_button_pressed():
	animation.stop()
	pop.play()

func _on_bubble_finished():
	get_tree().change_scene_to_file("res://Scenes/Cutscene.tscn")
