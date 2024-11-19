extends HBoxContainer

var _grid: GridContainer

func _ready() -> void:
	_get_nodes()
	_initialize_slots()
	GlobalHotbar.hotbar_updated.connect(_reload_slots)
	
func _get_nodes() -> void:
	_grid = get_node("GridContainer")

func _initialize_slots() -> void:
	var scene: PackedScene = preload("res://scenes/slot.tscn") as PackedScene
	for i in range(GlobalHotbar.hotbar_size):
		var node: slot = scene.instantiate()
		node.name = "Slot%s" % i
		node.index = i
		node.item = GlobalHotbar.get_item_in_slot(i)
		_grid.add_child(node)
		node.reload()

func _reload_slots() -> void:
	for child in _grid.get_children():
		if child is slot:
			child.reload()
