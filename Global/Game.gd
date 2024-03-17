extends Node

var Slot1 = 0

var PlayerUnitsDatabase = {
	0 : {
		"name": "Blaster",
		"scene": preload("res://players/player2.tscn")
	},
	1 : {
		"name": "Slasher",
		"scene": preload("res://players/player.tscn")
	}
}

var CurrentArmy = {
	0 : {
		"name": "Blaster",
		"cost": 5,
		"scene": preload("res://players/player2.tscn")
	},
	1 : {
		"name": "Slasher",
		"cost": 2,
		"scene": preload("res://players/player.tscn")
	},
	2 : {
		"name": "Disaster",
		"cost": 3,
		"scene": preload("res://players/player3.tscn")
	}
}

