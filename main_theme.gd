extends Node

@onready var music_player: AudioStreamPlayer = AudioStreamPlayer.new()
var is_playing = false

func _ready():
	if not is_playing:
		var theme_song = load("res://main menu/charlotte's mansion main theme.mp3")
		music_player.stream = theme_song
		add_child(music_player)
		music_player.play()
		is_playing = true

func stop_music():
	if music_player.playing:
		music_player.stop()
		is_playing = false
