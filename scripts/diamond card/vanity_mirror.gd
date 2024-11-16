extends Area2D

@onready var label: Label = $Label
var next_scene = "res://scenes/vanity_zoomed.tscn"

func _ready():
	$Label.visible = false  

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and get_tree().root.get_node("GameState").has_water and not GameState.has_diamond: 
		$Label.visible = true 
	elif body.name == "Alex" and GameState.has_diamond:
		label.visible = false 

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex":
		$Label.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") and $Label.visible:
		$Label.visible = false
		
		get_tree().change_scene_to_file(next_scene)
		
func interact_with_mirror():
	$Label.visible = false

	get_tree().root.get_node("GameState").throw_water_on_mirror()
	
