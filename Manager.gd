extends Node2D

var player 
var player2 
var player3
var army
var enemy = load("res://enemies/enemy.tscn")
var enemy2 = load("res://enemies/enemy2.tscn")

@onready var player_tower = $Players/player_tower
@onready var enemy_tower = $Enemies/enemy_tower

var game_over_screen = preload("res://game_over_screen.tscn")

@export var energy_per_second: int = 1
@export var energy: int = 5
@export var max_energy: int = 12
@export var default_spawn_cost : int = 2
@export var energy_upgrade_cost: int = 5

# Called when the node enters the scene tree for the first time.

var player_tower_x: int = 0
var enemy_tower_x: int = 0

func _ready():
	update_text()
	enemy_tower_x = enemy_tower.position.x
	player_tower_x = player_tower.position.x
	
	player = Game.CurrentArmy[0]["scene"]
	player2 = Game.CurrentArmy[1]["scene"]
	player3 = Game.CurrentArmy[2]["scene"]
	
	army = [player, player2, player3]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	var instance = enemy.instantiate()
	instance.position.y = 480
	instance.position.x = enemy_tower_x
	$Enemies.add_child(instance)
	var instance2 = enemy2.instantiate()
	instance2.position.y = 480
	instance2.position.x = enemy_tower_x
	$Enemies.add_child(instance2)

func _on_energy_recharge_timer_timeout():
	if energy <= max_energy:
		update_text()
		energy += energy_per_second
		if energy > max_energy:
			energy = max_energy

func _on_energy_button_pressed():
	if energy >= energy_upgrade_cost:
		energy = energy - energy_upgrade_cost
		energy_upgrade_cost += 5
		energy_per_second += 1
		max_energy += 8
		update_text()

func update_text():
	$UI/Energy.text = "%s/%s Energy (%s/s)" % [energy, max_energy, energy_per_second]
	$UI/EnergyButton.text = "More Energy: %sE" % energy_upgrade_cost

func _on_player_tower_player_tower_destroyed():
	var game_over = game_over_screen.instantiate()
	get_tree().paused = true
	add_child(game_over)

func _on_enemy_tower_enemy_tower_destroyed():
	var game_over = game_over_screen.instantiate()
	get_tree().paused = true
	add_child(game_over)

func _on_deploy_pressed(extra_arg_0):
	if Game.CurrentArmy[extra_arg_0] != null:
		var cost = Game.CurrentArmy[extra_arg_0]["cost"]
		if energy >= cost:
			energy = energy - cost
			var instance = Game.CurrentArmy[extra_arg_0]["scene"].instantiate()
			instance.position.y = 480
			instance.position.x = player_tower_x
			$Players.add_child(instance)
			update_text()
