extends Node

class_name Damageable

@export var health: float = 20

var timer: Timer

const CUP_HIT = preload("res://assets/sound_effects/cup-hit.mp3")

func _ready():
	# Initialize the timer
	timer = Timer.new()
	timer.wait_time = 0.2
	timer.one_shot = true
	timer.timeout.connect(Callable(self, "_on_hit_timer_timeout"))  # Correct usage
	add_child(timer)

	# Connect the animation_finished signal
	var animated_sprite = get_parent().get_node("AnimatedSprite2D")
	animated_sprite.connect("animation_finished", Callable(self, "_on_death_animation_finished"))  # Correct usage


func hit(damage: int):
	print("Ouch")
	health -= damage
	print("Health:", health)

	# Play the hit sound effect
	play_hit_sound()

	# Flash red and become semi-transparent
	get_parent().modulate = Color(1, 0, 0, 0.5)
	timer.start()

	if health <= 0:
		print("Health is zero. Triggering death...")
		disable_enemy()  # Disable movement and interactions
		play_death_sound()  # Play the death sound
		get_parent().get_node("AnimatedSprite2D").play("death")  # Trigger the death animation
		
func play_hit_sound():
	# Create a new AudioStreamPlayer node
	var hit_sound_player = AudioStreamPlayer.new()
	hit_sound_player.stream = CUP_HIT
	# Add the player to the enemy node so it's local to the enemy
	add_child(hit_sound_player)
	hit_sound_player.play()

	# Remove the AudioStreamPlayer after playback
	hit_sound_player.finished.connect(func():
		hit_sound_player.queue_free()
	)


func disable_enemy():
	var enemy = get_parent()
	# Disable processing
	enemy.set_physics_process(false)
	enemy.set_process(false)

	# Disable collisions
	for child in enemy.get_children():
		if child is CollisionShape2D:
			child.call_deferred("set_disabled", true)


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

func _on_death_animation_finished():
	var animated_sprite = get_parent().get_node("AnimatedSprite2D")
	var anim_name = animated_sprite.get_animation()
	print("Animation finished:", anim_name)
	if anim_name == "death":
		call_deferred("remove_enemy")  # Remove the enemy after the animation

func remove_enemy():
	# Remove the enemy node
	get_parent().queue_free()

func _on_hit_timer_timeout():
	if is_instance_valid(get_parent()):
		get_parent().modulate = Color(1, 1, 1, 1)
