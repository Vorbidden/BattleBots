extends Control

var player = load("res://players/player.tscn")

""" NOTE TO FUTURE SELF: 
	Working on an army select
	Trying to make it so you can select units
	Use globals in Game.gd for army and all units database
	Add scenes to global variable, load scenes in battles
	WORK ON ADDING UNITS TO AN ARMY FIRST
	then worry about animations in this screen (for now just hardcode)
	Good luck future me!
	Maybe work on having a default army first
	"""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Dont worry about this, just use like a name for now.
	match Game.Slot1:
		0:
			$UnitSelect.play("Unit 1")
		1:
			$UnitSelect.play("Unit 2")

func _on_next_unit_button_pressed():
	if Game.Slot1 < Game.PlayerUnitsDatabase.count():	
		Game.Slot1 += 1

func _on_prev_unit_button_pressed():
	if Game.Slot1 > 0:
		Game.Slot1 -= 1
		
func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
