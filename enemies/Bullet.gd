extends CharacterBody2D

@export var damage: int = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	velocity.x = 8000
	var collision = move_and_collide(velocity * delta)
	if collision:
		var collider = collision.get_collider()
		if collider.is_dying != true:
			collider.take_damage(damage)
			queue_free()
