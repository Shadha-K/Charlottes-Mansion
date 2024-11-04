# GlobalHealthManager.gd
extends Node

var hearts = []
var max_health = 9

func _ready():
	# Initial display update, but it will only work if hearts are initialized
	update_health_display()

func initialize_hearts(container: Node):
	# Clear the hearts array and populate it from the provided container
	hearts.clear()
	for child in container.get_children():
		if hearts.size() < max_health:
			hearts.append(child)
		else:
			break
	# Ensure we only update if hearts were initialized successfully
	if hearts.size() > 0:
		update_health_display()
	else:
		print("Warning: No heart nodes found in container.")

func update_health_display():
	# Only update if hearts array is not empty
	if hearts.size() == 0:
		print("Warning: Hearts array is empty. Initialize hearts first.")
		return

	for i in range(max_health):
		hearts[i].visible = (i < GameState.player_health)

func take_damage(amount = 1):
	if GameState.player_health > 0:
		GameState.decrease_health(amount)
		update_health_display()
