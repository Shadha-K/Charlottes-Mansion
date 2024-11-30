extends State
class_name CharSpike
@export var enemy: CharacterBody2D

func Enter():
	enemy.velocity = Vector2()  # Enemy stops moving

	$"../../AnimatedSprite2D".play("spike_attack")  # Plays punch animation
	
func sig():
	Transitioned.emit(self, "Idle")  # Changes state to Idle

##SCRIPT FOR ANIMATION AND STATE SWITCHING##
