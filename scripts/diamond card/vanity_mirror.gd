extends Area2D

@onready var label: Label = $Label

func _ready():
	$Label.visible = false  # Hide the label initially

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and get_tree().root.get_node("GameState").has_water: 
		$Label.visible = true  # Show label if the filled teacup is picked up

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex":
		$Label.visible = false  # Hide label when Alex leaves the area

func _process(_delta):
	if Input.is_action_just_pressed("interact") and $Label.visible:
		interact_with_mirror()

func interact_with_mirror():
	#temp code
	label.text = "4710"
	
	get_tree().root.get_node("GameState").throw_water_on_mirror()
