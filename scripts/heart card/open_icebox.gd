extends Node2D 

var next_scene = "res://kitchen.tscn"
@onready var label: Label = $Label
@onready var milk_sprite: Sprite2D = $Milk
@onready var bottle: Sprite2D = $Bottle
@onready var open_icebox: Area2D = $"."
@onready var broken_bottle: AnimatedSprite2D = $broken_bottle
@onready var hotbar: HBoxContainer = $CanvasLayer/Hotbar
@onready var note: Sprite2D = $note

var is_bottle_in_hotbar = GameState.has_bottle 
var is_dragging_bottle = false

func _ready():
	label.visible = false
	if GameState.has_milk == true:
		milk_sprite.visible = false
	else:
		milk_sprite.visible = true
	bottle.visible = false
	broken_bottle.visible = false
	note.visible = false 
	open_icebox.connect("body_entered", Callable(self, "_on_icebox_body_entered"))

func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		label.visible = true
		if not GameState.has_milk:
			GameState.has_milk = true
			milk_sprite.visible = false
			GameState.spawn_icebox = true
			GlobalHotbar.add_item_to_slot("Milk", preload("res://assets/puzzle_objects/milk.png"))
	
	if Input.is_action_just_pressed("interact") and GameState.has_milk:
		get_tree().change_scene_to_file(next_scene)
		
	# dragging bottle from hotbar to icebox
	if Input.is_action_just_pressed("click or drag")  and GameState.has_bottle and not is_dragging_bottle:
		if is_bottle_in_hotbar:  
			is_dragging_bottle = true
			bottle.position = Vector2(500, 200)
			#bottle.visible = true
			GlobalHotbar.item_used("bottle")
	
	if is_dragging_bottle:
		bottle.position = Vector2(500, 200)
	
	if is_dragging_bottle and Input.is_action_just_released("click or drag"):
		is_dragging_bottle = false
		_on_icebox_body_entered(bottle)

func _on_icebox_body_entered(body):
	if body == bottle:
			GlobalHotbar.item_used("Bottle")
			bottle.visible = false  
			GameState.has_bottle = false  
			
			play_broken_bottle_animation()

func play_broken_bottle_animation():
	broken_bottle.position = bottle.position  
	broken_bottle.visible = true
	broken_bottle.play("default")  
	await broken_bottle.animation_finished  # waiting for animation to finish
	broken_bottle.visible = false
	note.visible = true
	GameState.has_note = true
	GameState.spawn_icebox = true
	GlobalHotbar.add_item_to_slot("AceOfSpades", preload("res://assets/puzzle_objects/AceOfSpades.png"))

func _on_interact_with_note():
	if GameState.has_note:
		get_tree().change_scene_to_file(next_scene)
