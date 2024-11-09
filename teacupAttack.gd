extends Area2D

var player : CharacterBody2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().call_group("heartManager", "take_damage")
		get_tree().call_group("Player", "hit")



func _on_animated_sprite_2d_animation_changed():
	var anim_name = $"../AnimatedSprite2D".get_animation()
	if anim_name == "punch":
		await get_tree().create_timer(0.33).timeout
		monitoring = true



func _on_animated_sprite_2d_animation_finished():
	var anim_name = $"../AnimatedSprite2D".get_animation()
	
	if anim_name == "punch":
		monitoring = false
		await get_tree().create_timer(0.5).timeout
		$"../StateMachine/Attack".sig()
