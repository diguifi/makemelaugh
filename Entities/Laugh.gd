extends Node2D

var sad = preload("res://Assets/Sprites/notlaughing.png")
var happy = preload("res://Assets/Sprites/laghing.png")
@onready var laugh = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.adquiriu == 1:
		laugh.texture = sad
	if Global.adquiriu == 2:
		laugh.texture = happy
