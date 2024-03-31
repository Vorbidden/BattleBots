extends Control

const bgm = preload("res://audio/background_music.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if AudioControl.music_playing(bgm) == false:
		AudioControl.play_music(bgm, -30)

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://level_select.tscn")
	
func _on_tutorial_button_pressed():
	get_tree().change_scene_to_file("res://tutorial.tscn")

func _on_army_button_pressed():
	get_tree().change_scene_to_file("res://army_select.tscn")

func _on_recruit_button_pressed():
	pass

func _on_setting_button_pressed():
	get_tree().change_scene_to_file("res://setting_menu.tscn")
