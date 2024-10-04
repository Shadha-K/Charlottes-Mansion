extends Control




func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")
	Main_Theme_Music.stop_music()


func _on_options_pressed() -> void:
	pass # Replace with function body.



func _on_exit_pressed() -> void:
	get_tree().quit()
