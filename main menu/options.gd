extends Control


func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)

func _on_check_box_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)

func _on_resolutions_item_selected(index: int) -> void:
	var size = Vector2i(1920, 1080)  # Default size
	match index:
		0:
			size = Vector2i(2560, 1440)
		1:
			size = Vector2i(1920, 1080)
		2:
			size = Vector2i(1600, 900)
		3:
			size = Vector2i(1280, 720)

	# Defer the window size change to avoid conflicts
	call_deferred("set_window_size", size)

func set_window_size(size: Vector2i):
	DisplayServer.window_set_mode(DisplayServer.WindowMode.WINDOW_MODE_WINDOWED)
	DisplayServer.window_set_size(size)
	var screen_size = DisplayServer.screen_get_size(0)
	DisplayServer.window_set_position((screen_size - size) / 2)
