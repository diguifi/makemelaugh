extends Node2D

@onready var points_label = $Label
@onready var level_label = $Label2
@onready var attempts_label = $Label3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	points_label.text = 'POINTS: ' + str(snapped(Global.points, 0.1))
	level_label.text = 'LEVEL: ' + str(Global.level)
	attempts_label.text = str(Global.attempts) + '/' + str(Global.max_attempts)
