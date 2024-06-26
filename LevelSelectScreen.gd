extends Control

const LEVEL_BUTTON = preload("res://level_button.tscn")

@export_dir var dir_path

@onready var grid = $MarginContainer/VBoxContainer/GridContainer

func _ready():
	get_levels(dir_path)

func get_levels(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			create_level_button('%s/%s' % [dir_path, file_name], file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("No Levels found")
		
func create_level_button(level_path: String, level_name: String):
	var btn = LEVEL_BUTTON.instantiate()
	btn.text = level_name
	btn.level_path = level_path
	grid.add_child(btn)


func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
