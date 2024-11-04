extends Node2D

func _ready() -> void:
	var hearts_container = $HeartsContainer
	if hearts_container == null:
		print("Error: HeartsContainer node not found in the scene.")
	else:
		GlobalHealthManager.initialize_hearts(hearts_container)
