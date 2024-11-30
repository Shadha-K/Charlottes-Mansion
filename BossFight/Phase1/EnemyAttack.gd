extends State
class_name CharAttack
@export var enemy: CharacterBody2D
@onready var hit_sfx: AudioStreamPlayer2D = $hit_sfx

var player: CharacterBody2D

func Enter():
	enemy.velocity = Vector2()  # Enemy stops moving
	$"../../AnimatedSprite2D".play("swipe_attack")  # Play attack animation

func sig():
	Transitioned.emit(self, "Idle")  # Transition back to Follow when animation ends
