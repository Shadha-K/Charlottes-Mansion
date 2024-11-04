extends Area2D

var next_scene = "res://scenes/jewelrybox_zoomed.tscn" 
@onready var label: Label = $Label

func _ready():
	label.visible = false 

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and get_tree().root.get_node("GameState").got_code and not GameState.has_diamond:
		label.visible = true 
	elif body.name == "Alex" and GameState.has_diamond:
		label.visible = false
		
func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex":
		label.visible = false 
	
func _process(_delta):	
	if Input.is_action_just_pressed("interact") and $Label.visible:
		get_tree().change_scene_to_file(next_scene) 


	
