extends Button

@export_file var level_path
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	pass # Replace with function body.


func _on_mouse_exited():
	pass # Replace with function body.

func _on_pressed():
	if level_path == null:
		return
	get_tree().change_scene_to_file(level_path)
	AudioControl.stop_music()
	print("a")
