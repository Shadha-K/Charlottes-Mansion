extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"
@onready var label: Label = $Label

func action() -> void:
	DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
	GameState.d_trevor_dead = false

func _unhandled_input(event: InputEvent) -> void:
	var actions = get_overlapping_areas()
	if actions.size() > 0:
		label.visible = true
		return
	else:
		label.visible = false
		return
