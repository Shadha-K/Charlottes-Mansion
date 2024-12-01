extends State
class_name CharHead
@export var enemy: CharacterBody2D

func Enter():
	enemy.velocity = Vector2()  # Enemy stops moving
	GameState.damagable = false
	$"../../AnimatedSprite2D".play("floating_idle")
	
func sig():
	Transitioned.emit(self, "Idle")  # Changes state to Idle

##SCRIPT FOR ANIMATION AND STATE SWITCHING##
