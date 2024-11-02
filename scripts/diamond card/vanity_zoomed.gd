extends Node2D 

var next_room_scene = "res://bedroom.tscn" 
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $AnimatedSprite2D/Label
@onready var label2: Label = $AnimatedSprite2D/Label2

func _ready():
	if GameState.vanity_interacted:
		label.visible = false
		label2.visible = true
	else:
		label.visible = true  
		label2.visible = false

func _process(_delta):
	if not GameState.vanity_interacted:
		animated_sprite.play("foggy mirror")
		
		if Input.is_action_just_pressed("click or drag"):
			label.visible = false  
			label2.visible = true 
			GameState.vanity_interacted = true 
	if GameState.vanity_interacted:
		animated_sprite.play("numbers")
		
		if Input.is_action_just_pressed("interact"):
			get_tree().root.get_node("GameState").got_code = true
			get_tree().change_scene_to_file(next_room_scene)

	 
		
#func interact_with_mirror():
#	get_tree().root.get_node("GameState").throw_water_on_mirror()
		
		
		
