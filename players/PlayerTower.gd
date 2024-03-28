extends CharacterBody2D

signal player_tower_destroyed

@export var health: int = 500
var is_dying: bool = false

func _physics_process(delta: float) -> void:
	$HP.text = str(health)
	if health <= 0:
		emit_signal("player_tower_destroyed")
		queue_free()
		$CollisionShape2D.disabled = true
	# Update animations
	update_animations()

# Update character animations based on the current state
func update_animations():
	$Sprite2D.play("idle")

func take_damage(damage: int):
	health -= damage
	
