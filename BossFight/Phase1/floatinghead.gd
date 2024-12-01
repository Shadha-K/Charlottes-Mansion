extends CharacterBody2D

@export var speed: float = 800

func _process(delta: float) -> void:
	$AnimatedSprite2D.play("floating")
	var player = get_tree().get_nodes_in_group("Player").front()  # Assuming only one player in the group
	if player:
		var direction = (player.global_position - global_position).normalized()  # Direction toward the player
		translate(direction * speed * delta)
