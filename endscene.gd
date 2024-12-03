extends Node2D

var next_scene = "res://main menu/main_menu.tscn"
	
func _on_video_stream_player_finished():
	get_tree().change_scene_to_file(next_scene)

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file(next_scene)
		Main_Theme_Music.stop_music()
