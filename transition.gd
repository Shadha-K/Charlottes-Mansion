extends CanvasLayer

signal transitioned

signal wait

func _ready():
	$AnimationPlayer.play("clear")
	emit_signal("wait")

func transition():
	$AnimationPlayer.play("fadeblack")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fadeblack":
		emit_signal("transitioned")
		$AnimationPlayer.play("fadenorm")
