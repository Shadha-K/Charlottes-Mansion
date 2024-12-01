extends Node2D
@export var damageable : Damageable

func _on_animated_sprite_2d_animation_changed(): # called whenever animation for teacup changed
	var anim_name = $"../AnimatedSprite2D".get_animation() # gets animation name
	if anim_name == "death": 
		await get_tree().create_timer(0.33).timeout

func _on_animated_sprite_2d_animation_finished() -> void:
	var anim_name = $"../AnimatedSprite2D".get_animation() # gets animation name
	print(anim_name)
	if anim_name == "death":
		await get_tree().create_timer(0.5).timeout # pauses the teacup for .5 s
		damageable.disable_enemy()
		damageable.call_deferred("remove_enemy")
