extends Node2D

@onready var points_label = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	points_label.text = 'POINTS: ' + str(snapped(Global.points, 0.1))
