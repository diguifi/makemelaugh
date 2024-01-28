extends Camera2D

@export var shake_fade = 5.0

var rng = RandomNumberGenerator.new()

var shake_strength = 0.0

func _ready():
	Signals.connect('shake_camera', apply_shake)

func apply_shake(random_strength):
	shake_strength = random_strength

func _process(delta):
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength, 0, shake_fade * delta)
		offset = random_offset()

func random_offset():
	return Vector2(rng.randf_range(-shake_strength, shake_strength),rng.randf_range(-shake_strength, shake_strength))
