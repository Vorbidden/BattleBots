extends Node2D

var player = load("res://players/player.tscn")
var player2 = load("res://players/player2.tscn")
var enemy = load("res://enemies/enemy.tscn")
var enemy2 = load("res://enemies/enemy2.tscn")
var player_tower = load("res://players/player_tower.tscn")
var enemy_tower = load("res://enemies/enemy_tower.tscn")

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
	var i_player = player_tower.instantiate()
	i_player.position.y = 480
	player_tower_x = i_player.position.x
	$Players.add_child(i_player)
	var i_enemy = enemy_tower.instantiate()
	i_enemy.position.y = 480
	enemy_tower_x = i_enemy.position.x
	$Enemies.add_child(i_enemy)

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
	$UI/Energy.text = "%s / %s Energy" % [energy, max_energy]
	$UI/EnergyButton.text = "More energy: %sE" % energy_upgrade_cost

func _on_sword_button_pressed():
	if energy >= default_spawn_cost:
		energy = energy - default_spawn_cost
		var instance = player.instantiate()
		instance.position.y = 480
		instance.position.x = player_tower_x
		$Players.add_child(instance)
		update_text()

func _on_blaster_button_pressed():
	if energy >= 5:
		energy = energy - 5
		var instance = player2.instantiate()
		instance.position.y = 480
		instance.position.x = player_tower_x
		$Players.add_child(instance)
		update_text()
