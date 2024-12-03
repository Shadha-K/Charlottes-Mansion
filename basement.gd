extends Node2D

@onready var scary_atmosphere: AudioStreamPlayer2D = $scary_atmosphere
@export var boss_music_stream: AudioStream = preload("res://assets/Shadows of Despair.mp3")
@onready var boss_music: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.player_health = 9
	GameState.current_health = 9
	
	var dialogue=DialogueManager.show_example_dialogue_balloon(load("res://dialogue/basement.dialogue"), "start")
	GameState.opening = false
	Main_Theme_Music.stop_music()
	scary_atmosphere.play()
	
	boss_music.stream = boss_music_stream
	boss_music.play()

	DialogueManager.process_mode=Node.PROCESS_MODE_ALWAYS
	dialogue.process_mode=Node.PROCESS_MODE_ALWAYS
	get_tree().paused=true
	DialogueManager.dialogue_ended.connect(_unpause)
	return
func _unpause(_resource: ):
	#Main_Theme_Music.play_new_song("res://assets/gameplay_music.mp3") 
	get_tree().paused=false
	return
