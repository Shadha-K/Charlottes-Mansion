extends CharacterBody2D
class_name CharEnemy

var player : CharacterBody2D
@export var enemy : CharacterBody2D


func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player") #gets player position
	add_to_group("Enemy")

func _physics_process(_delta):
	move_and_slide()
	var direction = player.global_position - enemy.global_position 
	if velocity.length() > 0: #Set of if statements to control position of attack collider and direction of the sprite
		$AnimatedSprite2D.play("walk_side")
		if velocity.x > 0:
			$AnimatedSprite2D.flip_h = true
			$swipeattack/CollisionShape2D.position = Vector2(700, 10)
		else:
			$AnimatedSprite2D.flip_h = false
			$swipeattack/CollisionShape2D.position = Vector2(-700, 10)
	else:
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = true
			$swipeattack/CollisionShape2D.position = Vector2(700, 10)
		else:
			$AnimatedSprite2D.flip_h = false
			$swipeattack/CollisionShape2D.position = Vector2(-700, 10)


## GENERAL SCRIPT FOR TEACUP ORIENTATION ##
