extends State
class_name TransitionToPhase2

@export var boss: CharacterBody2D
@export var center_position: Vector2 = Vector2(320, 180)  # Example center position
@export var move_speed: float = 100.0
@export var animation_player: AnimationPlayer
@export var phase2_scene: String = "res://BossFight/Phase2/bossfight.tscn"

var has_reached_center = false
var has_played_animation = false

func Enter():
	has_reached_center = false
	has_played_animation = false
	boss.velocity = Vector2.ZERO

func Physics_Update(delta: float):
	if not has_reached_center:
		_move_to_center(delta)
	elif not has_played_animation:
		_play_transition_animation()
	else:
		_transition_to_phase2()

func _move_to_center(delta: float):
	var direction = (center_position - boss.global_position).normalized()
	boss.velocity = direction * move_speed
	boss.move_and_slide()

	if boss.global_position.distance_to(center_position) < 10:  # Considered "at center"
		has_reached_center = true
		boss.velocity = Vector2.ZERO

func _play_transition_animation():
	if animation_player and animation_player.has_animation("phase2_transition"):
		animation_player.play("phase2_transition")
		animation_player.animation_finished.connect(_on_animation_finished)
		has_played_animation = true

func _on_animation_finished(animation_name: String):
	if animation_name == "phase2_transition":
		has_played_animation = true

func _transition_to_phase2():
	get_tree().change_scene_to_file(phase2_scene)
