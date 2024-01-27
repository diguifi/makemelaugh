extends Node2D

@onready var button = $TextureButton
@onready var spawn1 = $Spawn1
@onready var spawn2 = $Spawn2
@onready var spawn3 = $Spawn3
@onready var spawn4 = $Spawn4
var brush1 = preload("res://Assets/Sprites/brush1.png")
var brush2 = preload("res://Assets/Sprites/brush2.png")
var pince = preload("res://Assets/Sprites/pince.png")
var itens = []
var speed = 250
var current_level = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var spawns = [spawn1, spawn2, spawn3, spawn4]
	itens = [brush1, brush2, pince]
	var random_item = randi_range(0,itens.size()-1)
	var random_spawn = randi_range(0,spawns.size()-1)
	button.texture_normal = itens[random_item]
	button.global_position = spawns[random_spawn].global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position.y -= delta * speed
	if current_level != Global.level:
		current_level = Global.level
		speed *= (Global.level+1)/2

func _on_texture_button_pressed():
	var points = (global_position.y/650) * 10
	Global.points += points
	Signals.emit_signal('point',points)
	queue_free()
