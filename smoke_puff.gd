extends Node2D

@onready var animation_player: AnimationPlayer = $burning_book/AnimationPlayer
@onready var flame_particles: CPUParticles2D = $CPUParticles2D
@onready var burning_book: AnimatedSprite2D = $burning_book  # Correctly referencing the Sprite2D node
@onready var label: Label = $burning_book/Label
@onready var hotbar = get_node("/root/node_2d/UI/CanvasLayer/Hotbar")

var next_room_scene = "res://node_2d.tscn"

func _ready():
	label.visible = false
	burning_book.visible = false  # Start with the burning book hidden
	flame_particles.visible=true
	# Connect a signal from the hotbar to trigger this function when an item is clicked
	self.connect("clover_picked_up", Callable(GameState, "_on_clover_picked_up"))

func _process(_delta):
	if Input.is_action_just_pressed("click or drag"):
		GameState.has_book=false
		GameState.has_clover=true	
		burning_book.visible = true  # Hide the burning book after interaction
		flame_particles.emitting = false  # Stop particle emission
		GlobalHotbar.add_item_to_slot("Clover", preload("res://assets/puzzle_objects/clover.png")) 
		animation_player.play("Burn_animation")
		#get_tree().change_scene_to_file(next_room_scene)
		if not animation_player.is_connected("animation_finished", Callable(self, "_on_animation_finished")):
			animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))

func _on_animation_finished(anim_name: String):
	# Ensure anim_name is a string to avoid comparison issues
	if typeof(anim_name) == TYPE_STRING and anim_name == "Burn_animation":
		flame_particles.emitting = false  # Stop the flame emission
		get_tree().change_scene_to_file(next_room_scene)  # Change scene after the animation completes
