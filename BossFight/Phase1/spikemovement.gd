extends CharacterBody2D

var direction : Vector2 = Vector2.LEFT
var speed : float = 70

func _ready() -> void:
	$AnimatedSprite2D.play("spike")



func _on_animated_sprite_2d_animation_looped() -> void:
	translate(direction*speed)
