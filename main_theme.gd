


extends Node

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()

func _ready():
	var theme_song = load("res://main menu/charlotte's mansion main theme.mp3") 
	music_player.stream = theme_song
	add_child(music_player)
	music_player.play() 

func stop_music():
	music_player.stop()

func _on_play_pressed():
	stop_music()
	get_tree().change_scene("res://node_2d.tscn")
