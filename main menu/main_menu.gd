extends Control

@onready var how_to_play_page: AnimatedSprite2D = $AnimatedSprite2D2
@onready var other_buttons: TextureRect = $TextureRect

func _ready():
	how_to_play_page.visible = false
	other_buttons.visible = true
	
	GameState.player_health = 9
	GameState.current_health = 9
	
	GameState.opening = true
	GameState.enemy_attacking = false

	#dialogue states (just to make sure things don't get confusing)
	GameState.d_first_card = true
	GameState.d_middle_cards = false
	GameState.d_last_card = false

	GameState.d_teacup = false
	GameState.d_full_cup = false
	GameState.d_has_code = false

	GameState.d_fire_book = false
	GameState.d_clover = false
	GameState.d_clover_pot = false
	GameState.d_trevor_dead = false

	GameState.d_recipes_book = false
	GameState.d_pie = false

	GameState.d_vial = false
	GameState.d_note_unread = false
	GameState.d_note_read = false

	#enemy spawing states
	GameState.spawn_2_enem = false
	GameState.spawn_4_enem = false
	GameState.spawn_bedroom = false
	GameState.spawn_icebox = false

	#ace of diamonds variables
	GameState.has_teacup = false
	GameState.has_water = false
	GameState.got_code = false
	GameState.sink_interacted = false
	GameState.vanity_interacted = false
	GameState.jewelry_box_open = false
	GameState.added_diamond = false
	GameState.has_diamond = false 

	#ace of clubs variables
	GameState.has_book = false
	GameState.book_used_in_fireplace = false
	GameState.has_clover = false
	GameState.clover_planted = false
	GameState.has_clubs = false

	#ace of hearts variables
	GameState.has_recipe_book = false
	GameState.has_flour = false
	GameState.has_sugar = false
	GameState.has_apples = false
	GameState.has_milk = false
	GameState.pie_full = false
	GameState.clock_checked = false
	GameState.correct_time = false
	GameState.pie_in_progress = false
	GameState.pie_clicked = false
	GameState.pie_cooked = false
	GameState.oven_exited = false
	GameState.has_hearts = false

	#ace of spades variables
	GameState.has_bottle = false
	GameState.has_spades = false

	#basement door variables
	GameState.diamond_card = false
	GameState.club_card = false
	GameState.heart_card = false
	GameState.first_time = true
	
	GameState.start_game = true

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
