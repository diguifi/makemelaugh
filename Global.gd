extends Node2D

var points = 0
var level = 1
var attempts = 0
var max_attempts = 10

var sucesso = false
var is_first_cene = true
var bg_osasco = preload("res://Assets/Bg/osasco_jpg.jpg")
var bg_paris = preload("res://Assets/Bg/paris_jpg.jpg")
var background = 0
var adquiriu = 0

func _ready():
	Signals.connect('point', _point)

func _point(_points):
	attempts += 1
	if (attempts >= max_attempts):
		next_level()

func next_level():
	var level_treshold = 75 - level * 4
	sucesso = points > level_treshold
	is_first_cene = false
	level += 1
	get_tree().change_scene_to_file("res://Scenes/Cutscene.tscn")
	points = 0
	attempts = 0
	
