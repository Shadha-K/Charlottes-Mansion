extends HBoxContainer

var hearts = []
var max_health = 9

func _ready():
	add_to_group("heartManager")

	# Assuming the HBoxContainer directly contains all heart nodes as children
	for child in get_children():
		if hearts.size() < max_health:  # Only add up to max_health hearts
			hearts.append(child)
		else:
			break

	update_health_display()

func update_health_display():
	# Display hearts based on GameState's current health
	for i in range(max_health):
		hearts[i].visible = (i < GameState.player_health)  # Ensure "GameState" matches your autoload name

func take_damage(amount = 1):
	if GameState.player_health > 0:
		GameState.decrease_health(amount)  # Decrease the global health using GameState's decrease_health function
		update_health_display()
		if GameState.player_health <= 0:  # Check if health reaches 0 after decreasing
			change_to_gameover()
	elif GameState.player_health == 0:  # Extra safeguard in case of unexpected calls
		change_to_gameover()

func change_to_gameover():
	get_tree().call_deferred("change_scene_to_file", "res://gameover.tscn")
		
func _on_teacup_hit(body):
	print("Teacup hit detected! Teacup:", body.name)
	take_damage()
