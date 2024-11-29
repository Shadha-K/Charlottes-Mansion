extends CanvasLayer

signal transitioned

var next_room = "res://BossFight/Phase1/bossfight.tscn"

signal wait

func _ready():
	$AnimationPlayer.play("clear")
	emit_signal("wait")
	#transition()

func transition():
	$AnimationPlayer.play("fadeblack")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fadeblack":
		emit_signal("transitioned")
		get_tree().change_scene_to_file(next_room)
		
