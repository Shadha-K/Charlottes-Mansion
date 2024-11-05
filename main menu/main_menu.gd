extends Control

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/cutscene.tscn")
	Main_Theme_Music.stop_music()


func _on_exit_pressed() -> void:
	get_tree().quit()
