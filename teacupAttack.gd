extends Area2D

var player : CharacterBody2D

func _on_body_entered(body: Node2D) -> void: #default function for attack zone
	if body.is_in_group("Player"):
		get_tree().call_group("heartManager", "take_damage") # minus health from heart bar
		get_tree().call_group("Player", "hit") # calls hit function in alex.gd
		#^^calls function in specified group in the tree


func _on_animated_sprite_2d_animation_changed(): #called whenever animation for teacup changed
	var anim_name = $"../AnimatedSprite2D".get_animation() #gets animation name
	if anim_name == "punch": 
		await get_tree().create_timer(0.33).timeout
		monitoring = true



func _on_animated_sprite_2d_animation_finished(): #called whenever animation for teacup ends
	var anim_name = $"../AnimatedSprite2D".get_animation() #gets animation name
	
	if anim_name == "punch": #checks that the animation is the punch animation
		monitoring = false #sets monitoring to false
		await get_tree().create_timer(0.5).timeout #pauses the teacup for .5 s
		$"../StateMachine/Attack".sig() #calls sig function of EnemyAttack.gd to send signal to change states
		
##SCRIPT FOR ATTACK ANIMATION PROCESSING ##
