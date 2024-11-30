extends CharacterBody2D
class_name CharEnemy

var player: CharacterBody2D
@export var enemy: CharacterBody2D
var is_attacking: bool = false


func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player") #gets player position
	add_to_group("Enemy")

func _physics_process(_delta):
	move_and_slide()
	var direction = player.global_position - enemy.global_position 

	if velocity.length() > 0: # If the character is moving
		if not GameState.enemy_attacking:
			if abs(velocity.x) > abs(velocity.y): # Moving more horizontally
				$AnimatedSprite2D.play("walk_side")
				if velocity.x > 0:
					$AnimatedSprite2D.flip_h = true
					$swipeattack/CollisionShape2D.position = Vector2(460, 10)
				else:
					$AnimatedSprite2D.flip_h = false
					$swipeattack/CollisionShape2D.position = Vector2(-460, 10)
			elif velocity.y > 0: # Moving downwards
				$AnimatedSprite2D.play("walk_down")
			else: # Moving upwards
				$AnimatedSprite2D.play("walk_up")
		else: # When not moving, use the direction to set idle orientation
			if abs(direction.x) > abs(direction.y): # Idle horizontal
				if direction.x > 0:
					$AnimatedSprite2D.flip_h = true
					$swipeattack/CollisionShape2D.position = Vector2(460, 10)
				else:
					$AnimatedSprite2D.flip_h = false
					$swipeattack/CollisionShape2D.position = Vector2(-460, 10)
			elif direction.y > 0: # Idle facing down
				$AnimatedSprite2D.play("walk_down")
			else: # Idle facing up
				$AnimatedSprite2D.play("walk_up")
