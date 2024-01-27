extends Node2D

@onready var blush_bad = $BlushBad
@onready var blush_good = $BlushGood
@onready var eye_bad = $EyeBad
@onready var eye_good = $EyeGood
@onready var batom_bad = $BatomBad
@onready var batom_good = $BatomGood
@onready var cilios_bad = $CiliosBad
@onready var cilios_good = $CiliosGood
@onready var rimel_bad = $RimelBad
@onready var rimel_good = $RimelGood
@onready var brinco_bad = $BrincoBad
@onready var brinco_good = $BrincoGood
var makes = []

# Called when the node enters the scene tree for the first time.
func _ready():
	makes = [[blush_bad,blush_good],
			[eye_bad,eye_good],
			[batom_bad,batom_good],
			[cilios_bad,cilios_good],
			[rimel_bad,rimel_good],
			[brinco_bad,brinco_good]]
	Signals.connect('point', _point)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _point(points):
	var random_make = randi_range(0, makes.size()-1)
	var make = makes[random_make]
	if points < 7:
		show_bad_make(make[0],make[1])
	else:
		show_good_make(make[0],make[1])

func show_good_make(bad, good):
	bad.visible = false
	good.visible = true
		
func show_bad_make(bad, good):
	bad.visible = true
	good.visible = false
