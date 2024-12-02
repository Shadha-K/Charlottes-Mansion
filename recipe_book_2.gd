extends Area2D

# Signal emitted when the book is picked up
var next_room_scene = "res://scenes/open_recipebook.tscn" 

@onready var player = null  
@onready var hotbar = get_node("/root/living_room/UI/Hotbar")  
@onready var label = $Label  # Correctly reference the Label

func _ready():
	label.visible = false  # Set label visibility to false by default
	var grandparent = get_parent().get_parent()
	player = grandparent.get_node("Alex")
	
	if GameState.has_recipe_book:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and GameState.club_card: 
		label.visible = true  

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex": 
		label.visible = false  

func _process(_delta):
	if Input.is_action_just_pressed("interact"):  
		if label.visible: 
			get_tree().change_scene_to_file(next_room_scene) 
			pick_up_book()

func pick_up_book():
	GlobalHotbar.add_item_to_slot("Recipe Book", preload("res://assets/puzzle_objects/RecipeBook.png"))
	GameState.d_recipes_book = true
	GameState.spawn_2_enem = true
	GameState.has_recipe_book = true
	queue_free()
