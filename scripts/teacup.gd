extends Node2D

var speed = 100 
var direction = Vector2.ZERO

func _ready():
	set_random_direction()

func _process(delta):
	position += direction * speed * delta
	
	if randf() < 0.01: 
		set_random_direction()

	var viewport_size = get_viewport().size
	if position.x < 0 or position.x > viewport_size.x:
		direction.x = -direction.x 
	if position.y < 0 or position.y > viewport_size.y:
		direction.y = -direction.y 

func set_random_direction():
	direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
