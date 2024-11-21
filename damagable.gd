extends Node

class_name Damageable

@export var health: float = 20 

var timer : Timer # Declare the timer variable

func _ready():
	# Initialize the timer
	timer = Timer.new()
	timer.wait_time = 0.5  # Set the wait time to 0.5 seconds
	timer.one_shot = true  # Make it a one-shot timer (it runs once)
	timer.timeout.connect(_on_hit_timer_timeout)  # Connect the timeout signal to the function
	add_child(timer)  # Add the timer to the scene tree

func hit(damage: int):
	print("Ouch")
	health -= damage
	
	if(health <= 0):
		get_parent().queue_free() # dies if less than 0 health
		
		# Flash red and become semi-transparent
	get_parent().modulate = Color(1, 0, 0, 0.5)  # Set the sprite's color to red with 50% transparency
	timer.start()  # Start the timer to reset after 0.5 seconds

# This function is called when the timer's timeout signal is emitted
func _on_hit_timer_timeout():
	get_parent().modulate = Color(1, 1, 1, 1)  # Restore the sprite's color to normal (full opacity)
##BASIC HEALTH SCRIPT##
