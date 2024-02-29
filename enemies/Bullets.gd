extends Node

var bullet = load("res://bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func shoot_bullet():
	var instance = bullet.instantiate()
	instance.transform = get_parent().get_node("Bullets").transform
	add_child(instance)
	
func _on_timer_timeout():
	var instance = bullet.instantiate()
	instance.transform = get_parent().transform
	add_child(instance)
