extends CharacterBody2D

const SPEED = 300.0
const GRAVITY = 980.0

var direction: Vector2 = Vector2.ZERO

@onready var animated_sprite_2D_animation = $AnimatedSprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hit_animation_player = $AnimationPlayer2
@onready var timer: Timer = Timer.new()  # Create a new Timer instance

func _ready():
	animated_sprite_2D_animation.play("idle_front")
	animation_tree.active = true
	add_to_group("Player")
	var teacups = get_tree().get_nodes_in_group("Teacups")
	for teacup in teacups:
		teacup.connect("teacup_picked_up", Callable(self, "_on_teacup_picked_up"))  # Connect to the teacup pickup signal

# Set up the timer
	timer.wait_time = 0.5
	timer.one_shot = true
	timer.timeout.connect(_on_hit_timer_timeout)
	add_child(timer)  # Add the timer to the scene tree
	
func _process(_delta):
	update_animation_parameters()

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * _delta

	direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction != Vector2.ZERO:
		direction = direction.normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()

func update_animation_parameters():
	if velocity.length() < 0.1:
		animation_tree["parameters/conditions/idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
	
	if Input.is_action_just_pressed("swing"):
		animation_tree["parameters/conditions/swing"] = true
		#get_node("attack").armed()
	else:
		animation_tree["parameters/conditions/swing"] = false
		#get_node("attack").disarm()
		
	if direction != Vector2.ZERO:
		animation_tree["parameters/idle/blend_position"] = direction
		animation_tree["parameters/skipping/blend_position"] = direction
		animation_tree["parameters/swing_sword/blend_position"] = direction

# This function is triggered when the teacup is picked up
func _on_teacup_picked_up():
	var hotbar = get_node("/root/Hotbar")  # Reference to the hotbar
	hotbar.add_item_to_slot(0, "Teacup", preload("res://assets/puzzle_objects/puzzle_cup.png"))
	print("Teacup added to hotbar!")
	
func hit(): #function for when Alex is hit
	print("HIT")
#	hit_animation_player.play("hit_animation")
	modulate = Color(1, 0, 0, 0.5)  # Set the character's color to red with half transparency
	timer.start()  # Start the timer

# This function is called when the timer's timeout signal is emitted
func _on_hit_timer_timeout():
	modulate = Color(1, 1, 1, 1)  # Restore the character's color to normal with full opacity
