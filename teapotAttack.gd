extends Node2D

var projectile = preload("res://projectile.tscn")
var player : CharacterBody2D
var target : Node2D = null


func _on_animated_sprite_2d_animation_changed(): # called whenever animation for teacup changed
	var anim_name = $"../AnimatedSprite2D".get_animation() # gets animation name
	if anim_name == "attack": 
		await get_tree().create_timer(0.33).timeout

func _on_animated_sprite_2d_animation_finished() -> void:
	var anim_name = $"../AnimatedSprite2D".get_animation() # gets animation name
	print(anim_name)
	if anim_name == "attack": 
		player = get_tree().get_first_node_in_group("Player") # get reference to player
		var b = projectile.instantiate()
		get_tree().root.add_child(b)
		b.global_position = $"../Marker2D".global_position
		var dir = (player.global_position - global_position).normalized()
		b.direction = dir
		await get_tree().create_timer(0.5).timeout # pauses the teacup for .5 s
		
		
		
		$"../StateMachine/Attack".sig()
