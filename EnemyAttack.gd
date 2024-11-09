extends State
class_name EnemyAttack
@export var enemy:CharacterBody2D

func Enter():
	enemy.velocity = Vector2() # teacup stops

	$"../../AnimatedSprite2D".play("punch") #plays punch animation

func sig():
	Transitioned.emit(self, "Idle") #Changes state to Idle

##SCRIPT FOR ANIMATION AND STATE SWITCHING##
