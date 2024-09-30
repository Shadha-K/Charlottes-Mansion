extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 980.0

@onready var sprite = $Sprite2D

var right_texture: Texture2D
var left_texture: Texture2D
var top_texture: Texture2D
var down_texture= Texture2D

func _ready():
	right_texture = preload("res://assets/AlexSprite/SpriteRight.png")
	left_texture = preload("res://assets/AlexSprite/SpriteLeft.png")
	top_texture = preload("res://assets/AlexSprite/SpriteFront.png")
	down_texture= preload("res://assets/AlexSprite/SpriteBack.png")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Handle sprite texture swap based on movement direction
	if direction.x > 0:
		# Moving right
		sprite.texture = right_texture
	elif direction.x < 0:
		# Moving left
		sprite.texture = left_texture
	elif direction.y >0:
		sprite.texture =top_texture
	elif direction.y<0:
		sprite.texture=down_texture
	# Move the character
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)  # Decelerate to stop
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
