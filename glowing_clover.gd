extends Node2D



@onready var animation_player: AnimationPlayer = $glowingclover/AnimationPlayer

@onready var glowing_clover: AnimatedSprite2D = $glowingclover  
@onready var label: Label = $glowingclover/Label
@onready var hotbar = get_node("CanvasLayer/Hotbar")

var next_room_scene = "res://bedroom.tscn"

func _ready():
	label.visible = false
	glowing_clover.visible = false  
	
	#self.connect("clover_picked_up", Callable(GameState, "_on_clover_picked_up"))

func _process(_delta):
	if not GameState.has_clubs:
		if Input.is_action_just_pressed("click or drag"):
			
			animation_player.play("glowingclover")
			
			GlobalHotbar.item_used("Clover")
			GameState.has_clubs=true
			#get_tree().change_scene_to_file(next_room_scene)
			if not animation_player.is_connected("animation_finished", Callable(self, "_on_animation_finished")):
				animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))
			glowing_clover.visible = true 
			GlobalHotbar.add_item_to_slot("Club Card", preload("res://assets/puzzle_objects/AceOfClubs.png"))
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file(next_room_scene)
	
		
func _on_animation_finished(anim_name: String):
	
	if anim_name == "glowing_clover":
		label.visible=true
		
