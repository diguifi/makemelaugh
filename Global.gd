extends Node2D

var points = 0
var level = 1
var attempts = 0
var max_attempts = 15

func _ready():
	Signals.connect('point', _point)

func _point(_points):
	attempts += 1
	if (attempts >= max_attempts):
		next_level()

func next_level():
	level += 1
	attempts = 0
