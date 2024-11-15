extends Area2D

var next_room_scene = "res://scenes/sink_zoomed.tscn"
@onready var label: Label = $Label
var spawn_point_name = "SinkAlexSpawn"
var spawn_point_name2 = "SinkCharSpawn"

func _ready():
	if GameState.sink_interacted:
		queue_free()
		
	label.visible = false 

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and get_tree().root.get_node("GameState").has_teacup: 
		label.visible = true 

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex": 
		label.visible = false  

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact") and label.visible:
		pick_up_filled_cup()

func pick_up_filled_cup():
	GameState.last_spawn_point_Alex = spawn_point_name
	GameState.last_spawn_point_charlotte =spawn_point_name2
	get_tree().change_scene_to_file(next_room_scene)
