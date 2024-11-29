extends CharacterBody2D

@export var parent: CharacterBody2D
var speed = 150.0
var target = Vector2(470, 10)
var growth_rate: float = 1
var target_scale: Vector2 = Vector2(0.18, 0.18)
var growing: bool = true
var trans = true

func _physics_process(_delta):
	var direction_to_player = (target - position).normalized()
	
	if position.distance_to(target) > 2: 
		velocity = direction_to_player * speed
	else:
		velocity = Vector2.ZERO 

	if velocity.x != 0:
		$AnimatedSprite2D.scale.x = sign(velocity.x)

	if velocity.length() > 2:
		$AnimatedSprite2D.play("walknormal")
	else:
		if trans:
			if scale == target_scale:
				$AnimatedSprite2D.play("transformation")
				await $AnimatedSprite2D.animation_finished  # Wait for transformation animation to finish
				trans = false  # Set trans to false only after animation completes
				#$AnimatedSprite2D.stop()
				$Transition.transition()
		else:
			await get_tree().create_timer(1).timeout
			$AnimatedSprite2D.play("idle")

	move_and_slide()

func _process(delta: float) -> void:
	if growing:
		scale = scale.lerp(target_scale, growth_rate * delta)
		if scale.distance_to(target_scale) < 0.01:
			scale = target_scale
			growing = false
