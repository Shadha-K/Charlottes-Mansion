extends CanvasLayer

signal transitioned


signal wait

func _ready():
	transition()

func transition():
	$AnimationPlayer.play("fadenorm")
