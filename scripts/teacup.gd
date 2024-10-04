extends Node2D

var speed = 100 
var direction = Vector2.ZERO
var is_punching = false

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready():
	set_random_direction()
	
	ray_cast_left.enabled = true
	ray_cast_right.enabled = true
	ray_cast_up.enabled = true
	ray_cast_down.enabled = true

func _process(delta):
	position += direction * speed * delta
	
	ray_cast_left.force_raycast_update()
	ray_cast_right.force_raycast_update()
	ray_cast_up.force_raycast_update()
	ray_cast_down.force_raycast_update()

	#horizontal
	if ray_cast_left.is_colliding():
		direction.x = abs(direction.x)
	elif ray_cast_right.is_colliding():
		direction.x = -abs(direction.x)
	
	#vertical
	if ray_cast_up.is_colliding():
		direction.y = abs(direction.y)
	elif ray_cast_down.is_colliding():
		direction.y = -abs(direction.y)


func set_random_direction():
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
