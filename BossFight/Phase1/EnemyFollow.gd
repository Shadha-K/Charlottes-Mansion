extends State
class_name CharFollow

@export var enemy: CharacterBody2D
@export var move_speed := 40.0
var player: CharacterBody2D
@export var attackRadius: int
@export var followRadius: int

# Reference to the health manager
var health_manager: Node = null

func Enter():
	player = get_tree().get_first_node_in_group("Player")  # Get reference to player

	# Get reference to the HealthManager
	health_manager = enemy.get_node_or_null("healthmanager")
	if not health_manager:
		print("HealthManager not found in enemy!")

func Physics_Update(_delta: float):
	if not health_manager:
		print("HealthManager is missing!")
		return

	var health = health_manager.health  # Access the health value
	var direction = player.global_position - enemy.global_position  # Calculate distance and direction

	# Health-based attack transition
	if health <= 200 and health > 100 and GameState.has_played_head1 == false:
		Transitioned.emit(self, "HeadAttack")
		print(health)
	elif health <= 100 and health > 0 and GameState.has_played_head2 == false:
		Transitioned.emit(self, "HeadAttack")
		print(health)
	elif health <= 0:
		print(health)
		return
	else:
		# Follow or idle behavior
		if direction.length() > followRadius:
			print("Player out of follow radius. Transitioning to Idle.")
			enemy.velocity = Vector2.ZERO  # Stop movement
			Transitioned.emit(self, "Idle")
			return

		# Adjust velocity to follow player
		if direction.length() > 25:
			enemy.velocity = direction.normalized() * move_speed
		else:
			enemy.velocity = Vector2.ZERO

		# Custom logic for attack radius
		var adjusted_attack_radius_x = attackRadius  # Horizontal attack radius
		var adjusted_attack_radius_y = attackRadius * 1.5  # Vertical attack radius (increase as needed)

		# Check if the player is within the attack radius
		if abs(direction.x) < adjusted_attack_radius_x and abs(direction.y) < adjusted_attack_radius_y:
			if abs(direction.x) > abs(direction.y):
				# Player is to the sides
				print("Transitioning to SwipeAttack. Direction:", direction)
				Transitioned.emit(self, "SwipeAttack")  # Emit swipe attack
			else:
				# Player is above or below
				print("Transitioning to SpikeAttack. Direction:", direction)
				Transitioned.emit(self, "SpikeAttack")  # Emit spike attack
