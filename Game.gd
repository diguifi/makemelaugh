extends Node2D

@onready var background_sprite = $BackgroundSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.background == 1:
		background_sprite.texture = Global.bg_osasco
		background_sprite.visible = true
	if Global.background == 2:
		background_sprite.texture = Global.bg_paris
		background_sprite.visible = true
		
