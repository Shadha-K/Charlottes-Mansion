class_name slot
extends Panel

var index: int
var item = {
	"name": "",
	"icon": null
}

var _texture: TextureRect

func _get_nodes() -> void:
	_texture = get_node("MarginContainer/TextureRect")

func reload() -> void:
	item = GlobalHotbar.get_item_in_slot(index)
	if item and item.has("icon"):
		_texture.texture = item["icon"]
	else:
		_texture.texture = null

func _ready() -> void:
	_get_nodes()
	reload()

func _get_drag_data(_at_position: Vector2) -> Variant:
	if not item or not item["icon"]:
		return null
	
	var texture = TextureRect.new()
	texture.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	texture.size = Vector2i(32, 32)
	texture.texture = item["icon"]
	
	set_drag_preview(texture)
	
	return index

#func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	#return typeof(data) == TYPE_INT

func _drop_data(at_position: Vector2, data: Variant) -> void:
	if typeof(data) == TYPE_INT:
		var source_index = int(data)
		GlobalHotbar.swap_items(source_index, index)
		reload()
