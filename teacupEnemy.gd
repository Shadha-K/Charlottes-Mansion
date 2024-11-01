extends CharacterBody2D
class_name TeacupEnemy

var player : CharacterBody2D
@export var enemy : CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")

func _physics_process(delta):
	move_and_slide()
	var direction = player.global_position - enemy.global_position
	
	if velocity.length() > 0:
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