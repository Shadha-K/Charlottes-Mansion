extends CharacterBody2D

const SPEED = 300.0
const GRAVITY = 980.0

# Declare 'direction' globally
var direction: Vector2 = Vector2.ZERO

@onready var animation_tree: AnimationTree = $AnimationTree

func _ready():
	animation_tree.active = true
	
func _process(_delta):
	update_animation_parameters()

func _physics_process(_delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * _delta

	# Update the global 'direction' variable
	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	# Handle sprite texture swap based on movement direction
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)  # Decelerate to stop
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()

func update_animation_parameters():
	# Check if the velocity is close to zero (idle state)
	if velocity.length() < 0.1:  # Using a small threshold for idle detection
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
		
	if Input.is_action_just_pressed("swing"):
		animation_tree["parameters/conditions/swing"] = true
	else:
		animation_tree["parameters/conditions/swing"] = false

	if(direction != Vector2.ZERO):
		# Use the global 'direction' variable for blend_position
		animation_tree["parameters/idle/blend_position"] = direction
		animation_tree["parameters/skipping/blend_position"] = direction
		animation_tree["parameters/swing_sword/blend_position"] = direction
