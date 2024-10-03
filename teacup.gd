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

	#punching range
	if is_near_main_character():
		punch()
	else:
		if !is_punching:
			animated_sprite_2d.play("walking")

func set_random_direction():
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func punch():
	if not is_punching:
		is_punching = true
		animated_sprite_2d.play("punch") 
		
func is_near_main_character() -> bool:
	var main_character = get_node("/root/living_room/TileMap/CharacterBody2D")  
	var distance = position.distance_to(main_character.position)
	print("Distance to main character: ", distance)   
	return distance < 600
	
