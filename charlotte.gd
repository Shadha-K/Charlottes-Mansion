extends CharacterBody2D

@export var parent: CharacterBody2D
var speed = 250.0
@onready var follow_point = parent.get_node("Sprite2D/FollowPoint")

func _physics_process(delta):
	var target = follow_point.global_position
	var direction_to_player = (target - position).normalized()
	
	if position.distance_to(target) > 75:  # Move towards if farther than 50 pixels
		velocity = direction_to_player * speed
	else:
		velocity = Vector2.ZERO  # Stop or handle other logic when close enough

	if velocity.x != 0:
		$AnimatedSprite2D.scale.x = sign(velocity.x)

	if velocity.length() > 0:
		$AnimatedSprite2D.play("walking_right")
	else:
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()
