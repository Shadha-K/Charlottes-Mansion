extends Node2D

var speed = 100 
var direction = Vector2.ZERO

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var area2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

##signal teacup_hit

var is_hit = false

func _ready():
	add_to_group("teacups")
	##$CollisionShape2D.connect("body_entered", Callable(self, "_on_Teacup_body_entered"))
	set_random_direction()

	# Enable ray casts
	ray_cast_left.enabled = true
	ray_cast_right.enabled = true
	ray_cast_up.enabled = true
	ray_cast_down.enabled = true

func _process(_delta):
	position += direction * speed * _delta

	# Update ray casts
	ray_cast_left.force_raycast_update()
	ray_cast_right.force_raycast_update()
	ray_cast_up.force_raycast_update()
	ray_cast_down.force_raycast_update()

	# Handle wall collisions
	if ray_cast_left.is_colliding():
		direction.x = abs(direction.x)
	elif ray_cast_right.is_colliding():
		direction.x = -abs(direction.x)

	if ray_cast_up.is_colliding():
		direction.y = abs(direction.y)
	elif ray_cast_down.is_colliding():
		direction.y = -abs(direction.y)

func set_random_direction():
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _on_teacup_body_entered(body):
	if body.name == "Alex" and not is_hit:
		is_hit = true  
		##emit_signal("teacup_hit", body)  
		var heart_manager = get_node("../CanvasLayer/HeartManager")  
		if heart_manager:
			heart_manager.take_damage()  

		await get_tree().create_timer(0.5).timeout
		is_hit = false 
