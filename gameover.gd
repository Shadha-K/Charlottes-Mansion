extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.player_health = 9
	GameState.current_health = 9

func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://main menu/main_menu.tscn")
