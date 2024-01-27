extends Node2D

var brush = preload("res://Entities/Brush.tscn")

func _on_timer_timeout():
	var brush_instance = brush.instantiate()
	add_child(brush_instance)
