extends Control

var Slot1 = 0
var player = load("res://players/player.tscn")
var unit_button = load("res://unit_button.tscn")

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

func _ready():
	
	for i in Game.PlayerUnitsDatabase:
		var instance = unit_button.instantiate()
		instance.unit_name = Game.PlayerUnitsDatabase[i]["name"]
		$HBoxContainer/TableOfUnits/ScrollContainer/VBoxContainer.add_child(instance)

	$UnitName.text = Game.PlayerUnitsDatabase[Slot1]["name"]
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_next_unit_button_pressed():
	if Slot1 < len(Game.PlayerUnitsDatabase) - 1:	
		Slot1 += 1
	$UnitName.text = Game.PlayerUnitsDatabase[Slot1]["name"]

func _on_prev_unit_button_pressed():
	if Slot1 > 0:
		Slot1 -= 1
	$UnitName.text = Game.PlayerUnitsDatabase[Slot1]["name"]
		
func _on_exit_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_unit_unit_pressed(unit_name):
	print(unit_name)
