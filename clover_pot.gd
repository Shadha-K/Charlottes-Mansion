extends Area2D

@onready var label: Label = $Label
var next_scene = "res://scenes/clover_grown.tscn"

func _ready():
	$Label.visible = false  

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and get_tree().root.get_node("GameState").has_clover: 
		$Label.visible = true 

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex":
		$Label.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") and $Label.visible:
		$Label.visible = false
		get_tree().change_scene_to_file(next_scene)
		
func interact_with_pot():
	$Label.visible = false
	get_tree().root.get_node("GameState").make_plant_grow()
