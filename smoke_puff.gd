extends Node2D

@onready var animation_player: AnimationPlayer = $burning_book/AnimationPlayer
@onready var flame_particles: CPUParticles2D = $CPUParticles2D
@onready var burning_book: AnimatedSprite2D = $burning_book  
@onready var label: Label = $burning_book/Label
@onready var hotbar = get_node("/root/node_2d/UI/CanvasLayer/Hotbar")

var next_room_scene = "res://node_2d.tscn"

func _ready():
	label.visible = false
	burning_book.visible = false  
	flame_particles.visible=true
	
	self.connect("clover_picked_up", Callable(GameState, "_on_clover_picked_up"))

func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		GameState.has_book=false
		GameState.has_clover=true	
		burning_book.visible = true 
		flame_particles.emitting = false  
		GlobalHotbar.add_item_to_slot("Clover", preload("res://assets/puzzle_objects/clover.png")) 
		animation_player.play("burning_book")
		#get_tree().change_scene_to_file(next_room_scene)
		if not animation_player.is_connected("animation_finished", Callable(self, "_on_animation_finished")):
			animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))
	if Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file(next_room_scene)
		
func _on_animation_finished(anim_name: String):
	
	if typeof(anim_name) == TYPE_STRING and anim_name == "burning_book":
		flame_particles.emitting = false 
		get_tree().change_scene_to_file(next_room_scene)  
