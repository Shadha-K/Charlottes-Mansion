extends Area2D

@export var damage: int = 10

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
		elif child is HealthChar:
			child.hit(damage)
	
	if body is TeacupEnemy:
		var knockback_direction = (body.global_position - global_position).normalized()
		body.apply_knockback(knockback_direction * 330) #knockback force
		
	if body is TeapotEnemy:
		var knockback_direction = (body.global_position - global_position).normalized()
		body.apply_knockback(knockback_direction * 270)
