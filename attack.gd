extends Area2D

@export var damage: int = 10
@export var knockback_force: float = 500

#func _ready() -> void:
	#monitoring = false

"""
func armed():
	monitoring = true
	print("ATTACK")

func disarm():
	monitoring = false
"""

func _on_body_entered(body: Node2D) -> void:
	for child in body.get_children():
		if child is Damageable:
			child.hit(damage)
	
	if body is TeacupEnemy:
		var knockback_direction = (body.global_position - global_position).normalized()
		body.apply_knockback(knockback_direction * knockback_force)
