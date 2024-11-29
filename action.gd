extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
@onready var label: Label = $Label

func action() -> void:
	var dialogue = DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	DialogueManager.process_mode=Node.PROCESS_MODE_ALWAYS
	dialogue.process_mode=Node.PROCESS_MODE_ALWAYS
	get_tree().paused=true
	DialogueManager.dialogue_ended.connect(_unpaused)
	GameState.d_trevor_dead = false

func _unhandled_input(event: InputEvent) -> void:
	var actions = get_overlapping_areas()
	if actions.size() > 0:
		label.visible = true
		return
	else:
		label.visible = false
		return

func _unpaused(_resource:):
	Main_Theme_Music.resume_music()
	get_tree().paused=false
	return
