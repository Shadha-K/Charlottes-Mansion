extends CharacterBody2D

var direction : Vector2 = Vector2.LEFT
var speed : float = 100


func _process(delta: float) -> void:
	translate(direction*speed*delta)
