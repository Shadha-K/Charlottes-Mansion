extends Area2D

var next_room = "res://endscene.tscn"

#reference to the label
@export var label: Label

func _ready():
	GameState.game_done = true
	add_to_group('END')
	self.hide()
	monitoring = false
	label.visible = false

#process function to listen for key press while player is near the door
func _process(_delta):
	if Input.is_action_just_pressed("interact") and label.visible:  
		get_tree().change_scene_to_file(next_room)


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex": 
		label.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex":
		label.visible = false

func unhide():
	self.show()
	monitoring = true
