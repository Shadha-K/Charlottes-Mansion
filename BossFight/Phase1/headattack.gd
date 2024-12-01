extends Node2D
class_name FloatingAttack

@export var floating_object_scene = preload("res://BossFight/Phase1/floatinghead.tscn")  # The floating object scene
@export var speed := 200  # Speed at which the floating object chases the player
@export var despawn_time: float = 10.0  # Time in seconds before despawning
@export var enemy: CharacterBody2D
var floating_instance: Node2D  # Reference to the floating object
var despawn_timer: Timer  # Timer for despawning

func _ready() -> void:
	# Initialize the despawn timer
	despawn_timer = Timer.new()
	despawn_timer.wait_time = despawn_time
	despawn_timer.one_shot = true
	despawn_timer.timeout.connect(_on_despawn_timer_timeout)
	add_child(despawn_timer)

func _on_animated_sprite_2d_animation_changed() -> void:
	var anim_name = $"../AnimatedSprite2D".get_animation()

	if anim_name == "floating_idle":
		# Spawn the floating object at the Marker2D position
		if !floating_instance:
			floating_instance = floating_object_scene.instantiate()
			floating_instance.global_position = $HeadMarker.global_position
			get_parent().add_child(floating_instance)

		# Start the despawn timer
		despawn_timer.start()

func _on_despawn_timer_timeout() -> void:
	# Despawn the floating instance when the timer times out
	print("Despawning floating head due to timer.")
	despawn_floating_object()
	GameState.damagable = true
	$"../StateMachine/HeadAttack".sig()  # Transition to another state if needed

func despawn_floating_object() -> void:
	if floating_instance:
		floating_instance.visible = false
		# Disable all processes and collisions
		disable_enemy()
		# Queue freeing the floating instance
		call_deferred("remove_enemy")

func disable_enemy() -> void:
	if floating_instance:
		floating_instance.set_physics_process(false)
		floating_instance.set_process(false)
		floating_instance.set_process_input(false)
		floating_instance.set_process_unhandled_input(false)
		floating_instance.set_process_unhandled_key_input(false)
		floating_instance.set_physics_process_internal(false)
		floating_instance.set_process_internal(false)
		# Disable collision shapes
		for child in floating_instance.get_children():
			if child is CollisionShape2D:
				child.disabled = true

func remove_enemy() -> void:
	if floating_instance:
		floating_instance.queue_free()
		floating_instance = null
