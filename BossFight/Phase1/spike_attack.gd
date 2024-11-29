extends State
class_name CharSpike
@export var enemy: CharacterBody2D
@onready var hit_sfx: AudioStreamPlayer2D = $hit_sfx

func Enter():
	enemy.velocity = Vector2()  # Enemy stops moving

	$"../../AnimatedSprite2D".play("spike_attack")  # Plays punch animation
	if hit_sfx:
		hit_sfx.play()
	else:
		print("Error: hit_sfx is null.")

func sig():
	Transitioned.emit(self, "Idle")  # Changes state to Idle

##SCRIPT FOR ANIMATION AND STATE SWITCHING##
