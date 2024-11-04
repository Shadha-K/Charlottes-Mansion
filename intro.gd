extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(6).timeout
	$AnimationPlayer.play("fade_out")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://main menu/main_menu.tscn")
