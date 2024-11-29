extends CharacterBody2D
class_name TeapotEnemy

var player : CharacterBody2D
@export var enemy : CharacterBody2D
var knockback_velocity: Vector2 = Vector2.ZERO
var knockback_timer: Timer = null

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player") #gets player position
	add_to_group("Enemy")
	
	knockback_timer = Timer.new()
	knockback_timer.one_shot = true
	knockback_timer.wait_time = 0.3
	knockback_timer.timeout.connect(self._on_knockback_timeout)
	add_child(knockback_timer)

func _physics_process(_delta):
	if knockback_velocity.length() > 0:
		velocity = knockback_velocity
		knockback_velocity = knockback_velocity.move_toward(Vector2.ZERO, 800 * _delta)
	else:
		# Add your normal movement logic here if needed
		var direction = player.global_position - enemy.global_position
		
		if velocity.length() > 0:  # Set of if statements to control position of marker and direction of the sprite
			$AnimatedSprite2D.play("walk")
			if velocity.x > 0:
				$AnimatedSprite2D.flip_h = true
				$Marker2D.position = Vector2(69, 98)
			else:
				$AnimatedSprite2D.flip_h = false
				$Marker2D.position = Vector2(-69, 98)
		else:
			if direction.x > 0:
				$AnimatedSprite2D.flip_h = true
				$Marker2D.position = Vector2(69, 98)
			else:
				$AnimatedSprite2D.flip_h = false
				$Marker2D.position = Vector2(-69, 98)
				
	move_and_slide()
	
func apply_knockback(force: Vector2) -> void:
	knockback_velocity = force
	knockback_timer.start()

func _on_knockback_timeout() -> void:
	knockback_velocity = Vector2.ZERO


## GENERAL SCRIPT FOR TEACUP ORIENTATION ##
