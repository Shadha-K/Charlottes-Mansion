extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameState.player_health = 9
	GameState.current_health = 9
	GlobalHotbar.reset_hotbar()
	
	if(not GameState.diamond_card):
		GameState.has_teacup = false
		GameState.has_water = false
		GameState.got_code = false
		GameState.sink_interacted = false
		GameState.vanity_interacted = false
		GameState.jewelry_box_open = false
		GameState.added_diamond = false
		GameState.has_diamond = false 
		
		GameState.d_teacup = false
		GameState.d_full_cup = false
		GameState.d_has_code = false
		
	elif(not GameState.club_card):
		GameState.has_book = false
		GameState.book_used_in_fireplace = false
		GameState.has_clover = false
		GameState.clover_planted = false
		GameState.has_clubs = false
		
		GameState.d_fire_book = false
		GameState.d_clover = false
		GameState.d_clover_pot = false
		GameState.d_trevor_dead = false
		
	elif(not GameState.heart_card):
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
		GameState.timer_done = false
		GameState.pie_is_done = false
		GameState.oven_exited = false
		GameState.has_hearts = false
		
		GameState.d_recipes_book = false
		GameState.d_pie = false
	
	elif(not GameState.spades_card):
		GameState.has_bottle = false
		GameState.has_note = false
		GameState.has_spades = false 	

func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://main menu/main_menu.tscn")
