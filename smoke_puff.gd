extends Node2D

@onready var animation_player: AnimationPlayer = $burning_book/AnimationPlayer
@onready var flame_particles: CPUParticles2D = $CPUParticles2D
@onready var burning_book: AnimatedSprite2D = $burning_book  
@onready var label: Label = $burning_book/Label
@onready var hotbar = get_node("CanvasLayer/Hotbar")

var spawn_point_name = "FireAlexSpawn"
var spawn_point_name2 = "FireCharSpawn"
var next_room_scene = "res://node_2d.tscn"

func _ready():
	label.visible = false
	burning_book.visible = false  
	flame_particles.visible=true

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		transition_to_next_scene()
		
func _on_animation_finished(anim_name: String):
	if anim_name == "burning_book":
		transition_to_next_scene()
	
func start_burning_sequence():
	GameState.has_clover = true
	burning_book.visible = true
	flame_particles.emitting = false
	GlobalHotbar.add_item_to_slot("Clover", preload("res://assets/puzzle_objects/clover.png"))
	animation_player.play("burning_book")
	if not animation_player.is_connected("animation_finished", Callable(self, "_on_animation_finished")):
		animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))

func transition_to_next_scene():
	GameState.last_scene_exited = "Fire"
	GameState.FireToLR_spawn_Alex = spawn_point_name
	GameState.FireToLR_spawn_Char = spawn_point_name2
	get_tree().change_scene_to_file(next_room_scene)
