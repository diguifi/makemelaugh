extends Node2D

var sad = preload("res://Assets/Sprites/notlaughing.png")
var happy = preload("res://Assets/Sprites/laghing.png")
var normal = preload("res://Assets/Sprites/laugh.png")
@onready var laugh = $Sprite2D
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	Signals.connect('react_happy', _react_happy)
	if Global.adquiriu == 1:
		laugh.texture = sad
	if Global.adquiriu == 2:
		laugh.texture = happy

func _react_happy():
	laugh.texture = happy
	timer.start()

func _on_timer_timeout():
	laugh.texture = normal
