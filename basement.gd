extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Main_Theme_Music.pause_music()
	var dialogue=DialogueManager.show_example_dialogue_balloon(load("res://dialogue/basement.dialogue"), "start")
	GameState.opening = false
	DialogueManager.process_mode=Node.PROCESS_MODE_ALWAYS
	dialogue.process_mode=Node.PROCESS_MODE_ALWAYS
	get_tree().paused=true
	DialogueManager.dialogue_ended.connect(_unpause)
	return
func _unpause(_resource: ):
	Main_Theme_Music.play_new_song("res://assets/gameplay_music.mp3") 
	get_tree().paused=false
	return
