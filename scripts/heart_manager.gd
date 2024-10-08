extends Node2D 

var hearts = []
var max_health = 9

func _ready():
	# Fetch all heart nodes and store them in the hearts array
	for i in range(max_health):
		var heart = $Heart1.get_parent().get_child(i)
		hearts.append(heart)

	update_health_display()

func update_health_display():
	# Display hearts based on GameState's current health
	for i in range(max_health):
		hearts[i].visible = (i < GameState.player_health)  # Ensure "GameState" matches your autoload name

func take_damage(amount = 1):
	if GameState.player_health > 0:
		GameState.decrease_health(amount)  # Decrease the global health using GameState's decrease_health function
		update_health_display()
		
func _on_teacup_hit(body):
	print("Teacup hit detected! Teacup:", body.name)  # Debugging line
	take_damage()
