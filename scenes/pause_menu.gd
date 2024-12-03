extends Control

@onready var exit_how_to_play: Button = $"AnimatedSprite2D2/exit how to play"
@onready var options: Control = $Options
@onready var exit_options: Button = $Options/exit_options
@onready var fullscreen: CheckButton = $Options/MarginContainer/VBoxContainer/Fullscreen
@onready var check_box: CheckBox = $Options/MarginContainer/VBoxContainer/CheckBox
@onready var volume: HSlider = $Options/MarginContainer/VBoxContainer/Volume
@onready var other_buttons: VBoxContainer = $MarginContainer/VBoxContainer
@onready var how_to_play_page: AnimatedSprite2D = $AnimatedSprite2D2

@onready var living_room: Node2D = $"../.."

func _ready():
	how_to_play_page.visible = false
	other_buttons.visible = true
	options.visible = false


func _on_resume_pressed() -> void:
	living_room.pauseMenu()

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_how_to_play_pressed() -> void:
	# Show the "How to Play" page and unpause animations
	how_to_play_page.visible = true
	other_buttons.visible = false
	Engine.time_scale = 1  # Unfreeze animations
	how_to_play_page.play("how_to_play")  # Play the animation


func _on_exit_how_to_play_pressed() -> void:
	how_to_play_page.visible = false
	other_buttons.visible = true

func _on_options_pressed() -> void:
	options.visible = true
	other_buttons.visible = false

func _on_exit_options_pressed() -> void:
	options.visible = false
	other_buttons.visible = true
	# Reset visibility of child nodes if needed.
	$Options/ColorRect.visible = true
	volume.visible = true
	fullscreen.visible = true
