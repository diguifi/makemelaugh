extends Node2D

@onready var alone_scene = $LaughAlone
@onready var level_scene = $LaughNextLevel
@onready var player = $AudioStreamPlayer
@onready var laugh_normal = $LaughAlone/Normal
@onready var laugh_laugh = $LaughAlone/Laugh
@onready var laugh_sad = $LaughAlone/Sad
@onready var skip = $SkipButton
var inicio = preload("res://Assets/Sfx/inicio.mp3")
var level1_1 = preload("res://Assets/Sfx/level1_1.mp3")
var level1_2 = preload("res://Assets/Sfx/level1_2.mp3")
var level1_bad = preload("res://Assets/Sfx/level1_bad.mp3")
var level1_good = preload("res://Assets/Sfx/level1_good.mp3")
var level2_1 = preload("res://Assets/Sfx/level2_1.mp3")
var level2_2 = preload("res://Assets/Sfx/level2_2.mp3")
var level2_bad = preload("res://Assets/Sfx/level2_bad.mp3")
var level2_good = preload("res://Assets/Sfx/level2_good.mp3")
var level3_1 = preload("res://Assets/Sfx/level3_1.mp3")
var level3_2 = preload("res://Assets/Sfx/level3_2.mp3")
var level3_bad = preload("res://Assets/Sfx/level3_bad.mp3")
var level3_good = preload("res://Assets/Sfx/level3_good.mp3")
var level4_1 = preload("res://Assets/Sfx/level4_1.mp3")
var level4_2 = preload("res://Assets/Sfx/level4_2.mp3")
var level4_bad = preload("res://Assets/Sfx/level4_bad.mp3")
var level4_good = preload("res://Assets/Sfx/level4_good.mp3")
var level5_1 = preload("res://Assets/Sfx/level5_1.mp3")
var level5_2 = preload("res://Assets/Sfx/level5_2.mp3")
var level5_bad = preload("res://Assets/Sfx/level5_bad.mp3")
var level5_good = preload("res://Assets/Sfx/level5_good.mp3")
var claps = preload("res://Assets/Sfx/clap.mp3")
var audio_number = 0
var audio_good
var audio_bad
var final_audio
var time = 0
var time_alone = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	check_translation()
	level_scene.visible = !Global.is_first_cene
	if Global.level == 1:
		player.stream = inicio
		player.play()
	elif Global.level == 2:
		audio_good = level1_good
		audio_bad = level1_bad
		final_audio = level1_2
		player.stream = level1_1
		player.play()
	elif Global.level == 3:
		audio_good = level2_good
		audio_bad = level2_bad
		final_audio = level2_2
		player.stream = level2_1
		player.play()
	elif Global.level == 4:
		audio_good = level3_good
		audio_bad = level3_bad
		final_audio = level3_2
		player.stream = level3_1
		player.play()
		if Global.sucesso:
			Global.background = 2
		else:
			Global.background = 1
	elif Global.level == 5:
		audio_good = level4_good
		audio_bad = level4_bad
		final_audio = level4_2
		player.stream = level4_1
		player.play()
		if Global.sucesso:
			Global.adquiriu = 2
		else:
			Global.adquiriu = 1
	elif Global.level == 6:
		audio_good = level5_good
		audio_bad = level5_bad
		final_audio = level5_2
		player.stream = level5_1
		player.play()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.is_first_cene:
		time+=delta
		alone_scene.visible = time > time_alone

func _on_audio_stream_player_finished():
	if Global.level == 1:
		get_tree().change_scene_to_file("res://Game.tscn")
	else:
		if audio_number == 0:
			if Global.sucesso:
				player.stream = audio_good
			else:
				player.stream = audio_bad
			player.play()
		if audio_number == 1:
			player.stream = final_audio
			player.play()
		if audio_number == 2:
			if Global.level == 6:
				laugh_normal.visible = false
				if Global.sucesso:
					laugh_laugh.visible = true
				else:
					laugh_sad.visible = true
				alone_scene.visible = true
				level_scene.visible = false
				player.stream = claps
				player.play()
			else:
				get_tree().change_scene_to_file("res://Game.tscn")
		audio_number += 1

func _on_texture_button_pressed():
	if Global.level != 6:
		get_tree().change_scene_to_file("res://Game.tscn")
	else:
		Global.reset()
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")

func check_translation():
	var locale = TranslationServer.get_locale()
	if not "pt" in locale:
		inicio = preload("res://Assets/Sfx/inicio_en.mp3")
		level1_1 = preload("res://Assets/Sfx/level_1_1_en.mp3")
		level1_2 = preload("res://Assets/Sfx/level1_2_en.mp3")
		level1_bad = preload("res://Assets/Sfx/level1_bad_en.mp3")
		level1_good = preload("res://Assets/Sfx/level1_good_en.mp3")
		level2_1 = preload("res://Assets/Sfx/level2_1_en.mp3")
		level2_2 = preload("res://Assets/Sfx/level2_2_en.mp3")
		level2_bad = preload("res://Assets/Sfx/level2_bad_en.mp3")
		level2_good = preload("res://Assets/Sfx/level2_good_en.mp3")
		level3_1 = preload("res://Assets/Sfx/level3_1_en.mp3")
		level3_2 = preload("res://Assets/Sfx/level3_2_en.mp3")
		level3_bad = preload("res://Assets/Sfx/level3_bad_en.mp3")
		level3_good = preload("res://Assets/Sfx/level3_good_en.mp3")
		level4_1 = preload("res://Assets/Sfx/level4_1_en.mp3")
		level4_2 = preload("res://Assets/Sfx/level4_2_en.mp3")
		level4_bad = preload("res://Assets/Sfx/level4_bad_en.mp3")
		level4_good = preload("res://Assets/Sfx/level4_good_en.mp3")
		level5_1 = preload("res://Assets/Sfx/level5_1_en.mp3")
		level5_2 = preload("res://Assets/Sfx/level5_2_en.mp3")
		level5_bad = preload("res://Assets/Sfx/level5_bad_en.mp3")
		level5_good = preload("res://Assets/Sfx/level5_good_en.mp3")
