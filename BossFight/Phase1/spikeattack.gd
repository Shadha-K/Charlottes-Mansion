extends Node2D
class_name spikeattack

@export var projectile_scene = preload("res://BossFight/Phase1/spike.tscn")
@export var spread_angle := 360  # Total spread in degrees (360 for a full circle)
@export var projectile_speed := 500  # Speed of the projectiles
@export var num_projectiles := 10 # Number of projectiles

func _on_animated_sprite_2d_animation_finished() -> void:
	var anim_name = $"../AnimatedSprite2D".get_animation()
	if anim_name == "spike_attack":
		# Calculate angles for each projectile
		var angle_step = deg_to_rad(spread_angle) / num_projectiles  # Angle between projectiles
		var start_angle = -deg_to_rad(spread_angle) / 2  # Start angle for first projectile

		for i in range(num_projectiles):
			var angle = start_angle + i * angle_step  # Calculate current angle
			var direction = Vector2(cos(angle), sin(angle))  # Convert angle to a direction vector

			# Instantiate and launch projectile
			var projectile_instance = projectile_scene.instantiate()
			var parent_node = get_parent()  # Add projectile to boss's parent or other container
			parent_node.add_child(projectile_instance)

			projectile_instance.global_position = $"../Marker2D".global_position
			projectile_instance.direction = direction.normalized()  # Pass direction to the projectile
			projectile_instance.speed = projectile_speed  # Optionally pass speed if needed
		await get_tree().create_timer(1).timeout #pauses the teacup for .5 s
		$"../StateMachine/SpikeAttack".sig()
