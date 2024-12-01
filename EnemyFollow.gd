extends State
class_name EnemyFollow

@export var enemy: CharacterBody2D
@export var move_speed := 40.0
var player : CharacterBody2D
@export var attackRadius : int
@export var followRadius : int
@export var damageable : Damageable

func Enter():
	player = get_tree().get_first_node_in_group("Player") # get reference to player
	damageable = get_node_or_null("../../health_manager")

func Physics_Update(_delta: float):
	var direction = player.global_position - enemy.global_position # calculate distance and direction
	
	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
		
	if damageable.health <= 0:
		Transitioned.emit(self, "Dead")
		
	elif direction.length() > followRadius:
		Transitioned.emit(self, "Idle") # player too far for enemy
		
	elif direction.length() < attackRadius:
		print(direction.length(), attackRadius)
		Transitioned.emit(self,"Attack") # enemy attacks

##SCRIPT FOR ENEMY BEHAVIOR WHEN IT NOTICES PLAYER##
