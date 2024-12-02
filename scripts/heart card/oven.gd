extends Area2D

var next_room = "res://scenes/oven_zoomed.tscn" 

#reference to the label
@onready var label: Label = $Label
@onready var label2: Label = $Label2
@onready var pie_done = $Timer
@onready var timer_sound = $Timer_sound

func _ready():
	label.visible = false
	label2.visible = false

func _on_body_entered(body):
	if not GameState.pie_cooked:
		if body.name == "Alex" and GameState.has_flour and GameState.has_sugar and GameState.has_milk and GameState.has_apples and not GameState.oven_exited and not GameState.has_hearts and not GameState.correct_time: 
			label.visible = true
		elif body.name == "Alex" and GameState.oven_exited and GameState.clock_checked and not GameState.correct_time and not GameState.has_hearts:
			label.visible = true
		elif body.name == "Alex" and GameState.correct_time and not GameState.oven_exited and not GameState.has_hearts:
			if pie_done.is_stopped() and not GameState.timer_done:
				pie_done.start(7)
			elif GameState.timer_done:
				label2.visible = true
		
func _on_body_exited(body):
	if body.name == "Alex":
		label.visible = false
		label2.visible = false 

#process function to listen for key press while player is near the door
func _process(_delta):
	if Input.is_action_just_pressed("interact") and label.visible:  
		get_tree().change_scene_to_file(next_room)
	elif Input.is_action_just_pressed("interact") and label2.visible:  
		get_tree().change_scene_to_file(next_room)
		
func _on_pie_done_timeout():
	$Timer_sound.play()
	GameState.timer_done = true
	if GameState.timer_done:
		var dialogue=DialogueManager.show_example_dialogue_balloon(load("res://dialogue/Pieready.dialogue"),"start")
		DialogueManager.process_mode=Node.PROCESS_MODE_ALWAYS
		dialogue.process_mode=Node.PROCESS_MODE_ALWAYS
		get_tree().paused=true
		DialogueManager.dialogue_ended.connect(_unpause)
			
func _unpause(_resource: ):
	get_tree().paused=false
	return
