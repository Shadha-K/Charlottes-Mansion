extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://main menu/main_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
