extends Control

@onready var how_to_play_page: AnimatedSprite2D = $AnimatedSprite2D2
@onready var other_buttons: TextureRect = $TextureRect

func _ready():
	how_to_play_page.visible = false
	other_buttons.visible = true

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/cutscene.tscn")
	Main_Theme_Music.stop_music()


func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_how_to_play_pressed() -> void:
	how_to_play_page.visible = true
	other_buttons.visible = false

func _on_exit_how_to_play_pressed() -> void:
	how_to_play_page.visible = false
	other_buttons.visible = true
