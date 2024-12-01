extends State
class_name CharFollow

@export var enemy: CharacterBody2D
@export var move_speed := 40.0
var player: CharacterBody2D
@export var attackRadius: int
@export var followRadius: int

# Reference to the health manager
var health_manager: Node = null
var last_health_check: int = -1  # Tracks the last health threshold checked

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
	if health % 100 == 0 and health != last_health_check and health != 300:
		last_health_check = health  # Update the last health check to the current value
		print("Transitioning to HeadAttack at health:", health)
		Transitioned.emit(self, "HeadAttack")
		return
	elif health % 100 != 0:
		# Reset last_health_check if no longer at a multiple of 100
		last_health_check = -1

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
