extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Main.tscn")
	
func _on_tutorial_button_pressed():
	get_tree().change_scene_to_file("res://tutorial.tscn")

func _on_army_button_pressed():
	get_tree().change_scene_to_file("res://army_select.tscn")
