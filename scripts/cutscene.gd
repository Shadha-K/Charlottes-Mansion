extends Node2D

func _on_video_stream_player_finished():
	get_tree().change_scene_to_file("res://node_2d.tscn")
