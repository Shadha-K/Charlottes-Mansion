extends CharacterBody2D
class_name TeapotEnemy

var player : CharacterBody2D
@export var enemy : CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player") #gets player position
	add_to_group("Enemy")

func _physics_process(_delta):
	move_and_slide()
	var direction = player.global_position - enemy.global_position 
	
	if velocity.length() > 0: #Set of if statements to control position of attack collider and direction of the sprite
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


## GENERAL SCRIPT FOR TEACUP ORIENTATION ##
