extends Node2D

@onready var hearts_container = get_node("CanvasLayer/HeartContainer")

func _ready() -> void:

	if hearts_container == null:
		print("Error: HeartsContainer node not found in the scene.")
	else:
		GlobalHealthManager.initialize_hearts(hearts_container)
