extends Node

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()
var is_playing = false
var theme_song = load("res://main menu/charlotte's mansion main theme.mp3")
func _ready():
	if not is_playing:
		music_player.stream = theme_song
		add_child(music_player)
		music_player.play()
		is_playing = true

func stop_music():
	if music_player.playing:
		music_player.stop()
		is_playing = false
		
func pause_music():
	print("pausing music")
	if music_player.playing:
		music_player.stream_paused=true
		is_playing =false
		
func resume_music():
	print("resuming music")
	if not is_playing:
		music_player.stream = theme_song
		add_child(music_player)
		music_player.play()
		is_playing = true
