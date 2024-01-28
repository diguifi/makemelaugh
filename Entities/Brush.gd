extends Node2D

@onready var button = $BrushBtn
@onready var spawn1 = $Spawn1
@onready var spawn2 = $Spawn2
@onready var spawn3 = $Spawn3
@onready var spawn4 = $Spawn4
@onready var power = $BrushBtn/Sprite2D
@onready var animation = $BrushBtn/AnimationPlayer
@onready var bubble = $Bubble
@onready var ping = $Ping
var brush1 = preload("res://Assets/Sprites/brush1.png")
var brush2 = preload("res://Assets/Sprites/brush2.png")
var pince = preload("res://Assets/Sprites/pince.png")
var itens = []
var speed = 250
var current_level = 0
var points = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var spawns = [spawn1, spawn2, spawn3, spawn4]
	itens = [brush1, brush2, pince]
	var random_item = randi_range(0,itens.size()-1)
	var random_spawn = randi_range(0,spawns.size()-1)
	button.texture_normal = itens[random_item]
	button.global_position = spawns[random_spawn].global_position
	power.global_position = spawns[random_spawn].global_position
	power.global_position.x += 30
	power.global_position.y += 30
	animation.play("strong_pulse")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var module = global_position.y/650
	points = module * 10
	power.modulate = Color(1,1,1,module*1.05)
	global_position.y -= delta * speed
	if current_level != Global.level:
		current_level = Global.level
		speed *= (Global.level+1)/2
		
func _on_texture_button_button_down():
	if visible:
		Signals.emit_signal('shake_camera', points/1.5)
		Global.points += points
		Signals.emit_signal('point',points)
		visible = false
		bubble.play()
		if points >= 7:
			Signals.emit_signal('react_happy')
			ping.play()

func _on_bubble_finished():
	if points < 7:
		queue_free()

func _on_ping_finished():
	queue_free()
