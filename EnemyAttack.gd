extends State
class_name EnemyAttack
@export var enemy:CharacterBody2D

func Enter():
	enemy.velocity = Vector2()

	$"../../AnimatedSprite2D".play("punch")

func sig():
	Transitioned.emit(self, "Idle")
