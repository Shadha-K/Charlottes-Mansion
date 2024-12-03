extends Node

class_name HealthChar

@onready var health_bar: ProgressBar = $"../CanvasLayer/HealthBar"

@export var health: int = 200
var phase2 = "res://BossFight/Phase2/bossfight.tscn"

var timer: Timer

func _ready():
	# Initialize the timer
	timer = Timer.new()
	timer.wait_time = 0.2
	timer.one_shot = true
	timer.timeout.connect(_on_hit_timer_timeout)
	add_child(timer)
	call_deferred("_init_health_bar")

func hit(damage: int):
	print("Ouch")
	health -= damage
	health_bar.health = health
	
	# Flash red and become semi-transparent
	get_parent().modulate = Color(1, 0, 0, 0.5)
	timer.start()
	if health <= 0:
		$"../AnimatedSprite2D".play("death")
		await $"../AnimatedSprite2D".animation_finished
		# Hide the enemy immediately
		get_parent().visible = false
		# Disable collision and processing
		disable_enemy()
		# Play death sound independently
		play_death_sound()
		# Remove the enemy node
		call_deferred("remove_enemy")
	

func disable_enemy():
	var enemy = get_parent()
	enemy.set_physics_process(false)
	enemy.set_process(false)
	enemy.set_process_input(false)
	enemy.set_process_unhandled_input(false)
	enemy.set_process_unhandled_key_input(false)
	enemy.set_physics_process_internal(false)
	enemy.set_process_internal(false)
	# Disable collision shapes
	for child in enemy.get_children():
		if child is CollisionShape2D:
			child.disabled = true

func play_death_sound():
	# Create a new AudioStreamPlayer node
	var death_sound_player = AudioStreamPlayer.new()
	death_sound_player.stream = preload("res://assets/sound_effects/cup_breaks.wav")
	# Add it to the scene root so it persists after the enemy is removed
	get_tree().root.add_child(death_sound_player)
	death_sound_player.play()
	# Connect the finished signal to remove the player node
	death_sound_player.finished.connect(func():
		death_sound_player.queue_free()
	)

func remove_enemy():
	# Remove the enemy node
	get_parent().queue_free()

func _on_hit_timer_timeout():
	if is_instance_valid(get_parent()):
		get_parent().modulate = Color(1, 1, 1, 1)
		
func _init_health_bar():
	if is_instance_valid(health_bar):
		health_bar.init_health(health)
	else:
		print("Health bar not found!")
