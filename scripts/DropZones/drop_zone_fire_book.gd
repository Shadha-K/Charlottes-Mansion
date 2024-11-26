extends TextureRect

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	return typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Book"

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if typeof(data) == TYPE_DICTIONARY and data.has("name") and data["name"] == "Book":
		# Update hotbar to indicate the book has been used
		
		# Access the fireplace nodes to trigger the burning sequence
		var burning_book = get_node("../burning_book")
		var animation_player = burning_book.get_node("AnimationPlayer")
		var flame_particles = get_node("../CPUParticles2D")
		var label = burning_book.get_node("Label")
		
		if burning_book and animation_player and flame_particles and label:
			# Make the burning book visible
			burning_book.visible = true
			label.visible = false
			
			# Stop the flame particles
			flame_particles.emitting = false
			
			# Play the burning book animation
			animation_player.play("burning_book")
			
			# Update game state
			GameState.has_clover = true
			GlobalHotbar.add_item_to_slot("Clover", preload("res://assets/puzzle_objects/clover.png"))
			
			# Connect animation finish signal
			if not animation_player.is_connected("animation_finished", Callable(self, "_on_animation_finished")):
				animation_player.connect("animation_finished", Callable(self, "_on_animation_finished"))
		else:
			print("Error: Missing nodes in the fireplace scene tree.")

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "burning_book":
		# Update game state and optionally handle scene transition
		GameState.last_scene_exited = "Fire"
		GameState.FireToLR_spawn_Alex = "FireAlexSpawn"
		GameState.FireToLR_spawn_Char = "FireCharSpawn"
		get_tree().change_scene_to_file("res://node_2d.tscn")
