extends State
class_name EnemyAttack
@export var enemy: CharacterBody2D
@onready var hit_sfx: AudioStreamPlayer2D = $hit_sfx
@export var damageable : Damageable

func Enter():
	print("Enemy Attack entered")
	enemy.velocity = Vector2()  # Enemy stops moving
	damageable = get_node_or_null("../../health_manager")

	$"../../AnimatedSprite2D".play("attack")  # Plays punch animation
	if hit_sfx:
		hit_sfx.play()
	else:
		print("Error: hit_sfx is null.")
		
func sig():
	if damageable.health <= 0:
		Transitioned.emit(self, "Dead")
	else:
		Transitioned.emit(self, "Idle")  # Changes state to Idle

##SCRIPT FOR ANIMATION AND STATE SWITCHING##
