extends State
class_name EnemyDead
@export var enemy: CharacterBody2D

func Enter():
	enemy.velocity = Vector2()  # Enemy stops moving
	$"../../AnimatedSprite2D".play("death")  # Plays death animation

func sig():
		Transitioned.emit(self, "Idle")  # Changes state to Idle
