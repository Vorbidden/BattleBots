extends CanvasLayer

@export var title = "Game Over"
@export var paused: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$PanelContainer/MarginContainer/VBoxContainer/Title.text = title
	if paused:
		$PanelContainer/MarginContainer/VBoxContainer/QuitButton.text = "Resume"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_quit_button_pressed():
	if paused:
		get_tree().paused = false
		self.queue_free()
	else:
		get_tree().quit()

func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_main_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
