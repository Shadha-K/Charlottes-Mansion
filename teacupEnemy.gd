extends CharacterBody2D
class_name TeacupEnemy

var player : CharacterBody2D
@export var enemy : CharacterBody2D
@export var damageable : Damageable
var knockback_velocity: Vector2 = Vector2.ZERO
var knockback_timer: Timer = null


func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player") #gets player position
	add_to_group("Enemy")
	knockback_timer = Timer.new()
	knockback_timer.one_shot = true
	add_child(knockback_timer)
	damageable = get_node_or_null("./health_manager")

func _physics_process(_delta):
	if knockback_velocity.length() > 0:
		velocity = knockback_velocity
		knockback_velocity = knockback_velocity.move_toward(Vector2.ZERO, 800 * _delta)
	move_and_slide()
	var direction = player.global_position - enemy.global_position 
	if velocity.length() > 0: #Set of if statements to control position of attack collider and direction of the sprite
		$AnimatedSprite2D.play("walk")	
		if velocity.x > 0:
			$AnimatedSprite2D.flip_h = true
			$attack/CollisionShape2D.position = Vector2(68.875, 10)
		else:
			$AnimatedSprite2D.flip_h = false
			$attack/CollisionShape2D.position = Vector2(-68.875, 10)
	else:
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = true
			$attack/CollisionShape2D.position = Vector2(68.875, 10)
		else:
			$AnimatedSprite2D.flip_h = false
			$attack/CollisionShape2D.position = Vector2(-68.875, 10)

func apply_knockback():
	if damageable.health > 0:
		var direction = (enemy.global_position - player.global_position).normalized()
		knockback_velocity = direction * 330
		knockback_timer.start(0.3)  # knockback lasts for 0.3 seconds
	else:
		knockback_velocity = Vector2.ZERO  # No movement after death


## GENERAL SCRIPT FOR TEACUP ORIENTATION ##
