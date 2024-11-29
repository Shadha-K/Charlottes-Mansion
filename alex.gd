extends CharacterBody2D

const SPEED = 300.0
const GRAVITY = 980.0

var direction: Vector2 = Vector2.ZERO
var is_swinging: bool = false  # Flag to track if the player is swinging

@onready var animated_sprite_2D_animation = $AnimatedSprite2D
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var hit_animation_player = $AnimationPlayer2
@onready var timer: Timer = Timer.new()  # Create a new Timer instance
@onready var finder: Area2D = $Dir/Finder

# Step 1: Preload the swing sound effect
var swing_sound = preload("res://assets/sound_effects/sword-swoosh.mp3")
var swing_sound_player: AudioStreamPlayer

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

	# Step 2: Initialize the swing sound player
	swing_sound_player = AudioStreamPlayer.new()
	swing_sound_player.stream = swing_sound
	add_child(swing_sound_player)  # Add the sound player to the player node

func _process(_delta):
	update_animation_parameters()

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("help"):
		var actions = finder.get_overlapping_areas()
		if actions.size() > 0:
			actions[0].action()
			return
	if not is_on_floor():
		velocity += get_gravity() * _delta

	# Prevent movement while swinging
	if is_swinging:
		velocity = Vector2.ZERO
		move_and_slide()
		return

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
		is_swinging = true  # Set swinging state
		animation_tree["parameters/conditions/swing"] = true

		# Step 3: Play the swing sound effect
		swing_sound_player.play()

		# Wait for the swing animation to complete
		await get_tree().create_timer(0.5).timeout
		is_swinging = false  # Reset swinging state
	else:
		animation_tree["parameters/conditions/swing"] = false
		
	if direction != Vector2.ZERO:
		animation_tree["parameters/idle/blend_position"] = direction
		animation_tree["parameters/skipping/blend_position"] = direction
		animation_tree["parameters/swing_sword/blend_position"] = direction

# This function is triggered when the teacup is picked up
func _on_teacup_picked_up():
	var hotbar = get_node("/root/Hotbar")  # Reference to the hotbar
	hotbar.add_item_to_slot(0, "Teacup", preload("res://assets/puzzle_objects/puzzle_cup.png"))
	
func hit():  # Function for when the player is hit
	modulate = Color(1, 0, 0, 0.5)  # Set the character's color to red with half transparency
	timer.start()  # Start the timer
	

# This function is called when the timer's timeout signal is emitted
func _on_hit_timer_timeout():
	modulate = Color(1, 1, 1, 1)  # Restore the character's color to normal with full opacity
