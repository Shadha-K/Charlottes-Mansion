extends Node2D 

var hearts = []
var max_health = 9
var current_health = 9 

func _ready():
	for i in range(max_health):
		var heart = $Heart1.get_parent().get_child(i)  
		hearts.append(heart)

	update_health_display()

func update_health_display():
	for i in range(max_health):
		hearts[i].visible = (i < current_health)

func take_damage():
	if current_health > 0:
		current_health -= 1
		update_health_display()
		
func _on_teacup_hit(body):
	print("Teacup hit detected! Teacup:", body.name)  # Debugging line
	take_damage()  # Or whatever you need to do in response
