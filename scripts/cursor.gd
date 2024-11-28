extends Node2D

var is_dragging = false
var cursor_dragging_texture : Texture = preload("res://assets/cursor_closed.png")
var drag_threshold : float = 10.0
var click_start_position : Vector2
var default_cursor_texture : Texture

func _ready():
	default_cursor_texture = preload("res://assets/cursor.png")

	Input.set_custom_mouse_cursor(default_cursor_texture, Input.CURSOR_ARROW)

func _process(delta):
	if is_dragging:
		Input.set_custom_mouse_cursor(cursor_dragging_texture, Input.CURSOR_ARROW)
	else:
		Input.set_custom_mouse_cursor(default_cursor_texture, Input.CURSOR_ARROW)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				click_start_position = get_global_mouse_position()
				is_dragging = false 

			else:
				is_dragging = false
				Input.set_custom_mouse_cursor(default_cursor_texture, Input.CURSOR_ARROW)

	elif event is InputEventMouseMotion:
		if event.button_mask & MOUSE_BUTTON_MASK_LEFT:
			if not is_dragging:
				var distance_moved = click_start_position.distance_to(get_global_mouse_position())
				if distance_moved >= drag_threshold:
					is_dragging = true
