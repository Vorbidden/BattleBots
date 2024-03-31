extends CharacterBody2D

# Define your character's movement properties
@export var speed: float = 200
@export var direction: float = 1

# Attributes
@export var multi_hit: bool = false
@export var damage: int = 10
@export var cost: int = 1
@export var attack_range: float = 200
@export var health: int = 50
@export var has_projectiles: bool = false

var jump_power: float = 500
var gravity: float = 1000
var is_attacking: bool = false
var attack_animation = ["attack", "attack_2", "attack_combo"][randi_range(0,2)]
var is_dying: bool = false
	
func _ready():
	$RayCast2D.target_position.x = attack_range * direction
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass
		
func _physics_process(delta: float) -> void:
	$HP.text = str(health)
	if health <= 0 and is_dying == false:
		is_dying = true
		$CollisionShape2D.disabled = true

	# Detect Unit in front to attack
	if $RayCast2D.get_collider() != null:
		if $RayCast2D.get_collider().is_dying != true and is_dying != true:
			if !is_attacking:
				if has_projectiles:
					$Bullets.shoot_bullet(damage)
				else:
					$RayCast2D.get_collider().take_damage(damage)
				play_sound()
			is_attacking = true
			velocity.x = 0
	else:
		if !is_attacking:
			velocity.x = direction * speed
			
	if is_dying:
		velocity.x = 0

	# Move the character using the updated velocity
	move_and_slide()

	# Update animations
	update_animations()
	
func play_sound():
	match $Name.text:
		"Enemy":
			$sword.play()
		"Enemy2":
			$enemy_laser.play()
		"Player":
			$sword.play()
		"Player2":
			$blast.play()
		"Player3":
			$pistol.play()
			
# Update character animations based on the current state
func update_animations():
	if is_dying:
		$Sprite2D.play("death")
	elif is_attacking:
		$Sprite2D.play("attack")
	elif velocity.x != 0:
		$Sprite2D.play("run")
	else:
		$Sprite2D.play("idle")

func take_damage(damage: int):
	health -= damage
	
func _on_sprite_2d_animation_finished():
	# Finish Death
	if is_dying == true:
		queue_free()
	# Finish Attack
	elif is_attacking:
		is_attacking = false
