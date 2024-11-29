extends State
class_name CharFollow

@export var enemy: CharacterBody2D
@export var move_speed := 40.0
var player : CharacterBody2D
@export var attackRadius : int
@export var followRadius : int
var swipe: bool = true

func Enter():
	player = get_tree().get_first_node_in_group("Player") # get reference to player

func Physics_Update(_delta: float):
	var direction = player.global_position - enemy.global_position
	# Only move if outside attack radius
	if direction.length() > attackRadius:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()  # Stop moving when in attack range
	
	# Handle transitions
	if direction.length() > followRadius:
		Transitioned.emit(self, "Idle")
	elif direction.length() < attackRadius:
		if swipe:
			Transitioned.emit(self, "SwipeAttack")
			var rand = randi() % 2  
			if rand == 1:
				swipe = false
		else:
			Transitioned.emit(self, "SpikeAttack")
			swipe = true

##SCRIPT FOR ENEMY BEHAVIOR WHEN IT NOTICES PLAYER##
