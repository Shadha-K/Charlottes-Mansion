extends State
class_name CharFollow

@export var enemy: CharacterBody2D
@export var move_speed := 40.0
var player: CharacterBody2D
@export var attackRadius: int
@export var followRadius: int

func Enter():
	player = get_tree().get_first_node_in_group("Player") # Get reference to player

func Physics_Update(_delta: float):
	var direction = player.global_position - enemy.global_position # Calculate distance and direction

	if direction.length() > 25:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()

	if direction.length() > followRadius:
		Transitioned.emit(self, "Idle") # player too far for enemy

	# Custom logic for attack radius with a longer vertical range
	var adjusted_attack_radius_x = attackRadius # Horizontal attack radius
	var adjusted_attack_radius_y = attackRadius * 1.5 # Vertical attack radius (increase as needed)

	# Check if the player is within the attack radius
	if abs(direction.x) < adjusted_attack_radius_x and abs(direction.y) < adjusted_attack_radius_y:
		if abs(direction.x) > abs(direction.y):
			# Player is to the sides
			Transitioned.emit(self, "SwipeAttack") # Emit swipe attack
		else:
			# Player is above or below
			Transitioned.emit(self, "SpikeAttack") # Emit spike attack
