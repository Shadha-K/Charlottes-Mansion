extends Node2D 

var next_room_scene = "res://bedroom.tscn" 
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var label2: Label = $AnimatedSprite2D/Label2
@onready var hotbar = get_node("CanvasLayer/Hotbar")
var spawn_point_name = "VanityToBRAlex"
var spawn_point_name2 = "VanityToBRChar"

func _ready():
	label2.visible = GameState.vanity_interacted

func _process(_delta):
	if not GameState.vanity_interacted:
		animated_sprite.play("foggy mirror")
	else:
		animated_sprite.play("numbers")
		
	if GameState.vanity_interacted and Input.is_action_just_pressed("interact"):
		get_tree().root.get_node("GameState").got_code = true
		GameState.d_full_cup = false
		GameState.d_has_code = true
		GameState.last_scene_exited = "Vanity"
		GameState.VanityToBR_spawn_Alex = spawn_point_name
		GameState.VanityToBR_spawn_Char = spawn_point_name2
		get_tree().change_scene_to_file(next_room_scene)

	 
		
#func interact_with_mirror():
#	get_tree().root.get_node("GameState").throw_water_on_mirror()
		
		
		
