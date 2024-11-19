extends Control

# Declare the current number variable
var current_number: int = 0
var current_number2: int = 0
var current_number3: int = 0
var current_number4: int = 0

var correct_code: Array = [4, 1, 7, 0]

var next_room_scene = "res://scenes/open_jewelrybox.tscn" 
var spawn_point_name= "JBoxToBRAlex"
var spawn_point_name2="JBoxToBRChar"
func _ready():
	# Connect button signals to functions using callable
	$VBoxContainer/up_button.pressed.connect(_on_UpButton_pressed)
	$VBoxContainer/down_button.pressed.connect(_on_DownButton_pressed)
	$VBoxContainer2/up_button.pressed.connect(_on_UpButton2_pressed)
	$VBoxContainer2/down_button.pressed.connect(_on_DownButton2_pressed)
	$VBoxContainer3/up_button.pressed.connect(_on_UpButton3_pressed)
	$VBoxContainer3/down_button.pressed.connect(_on_DownButton3_pressed)
	$VBoxContainer4/up_button.pressed.connect(_on_UpButton4_pressed)
	$VBoxContainer4/down_button.pressed.connect(_on_DownButton4_pressed)
	
	# Update the label initially
	update_number_label()

# Function to handle Up button pressed
func _on_UpButton_pressed():
	current_number = (current_number + 1) % 10  # Increment and wrap around at 10
	update_number_label()
	check_code()
	
func _on_UpButton2_pressed():
	current_number2 = (current_number2 + 1) % 10  # Increment and wrap around at 10
	update_number_label()
	check_code()
	
func _on_UpButton3_pressed():
	current_number3 = (current_number3 + 1) % 10  # Increment and wrap around at 10
	update_number_label()
	check_code()
	
func _on_UpButton4_pressed():
	current_number4 = (current_number4 + 1) % 10  # Increment and wrap around at 10
	update_number_label()
	check_code()

# Function to handle Down button pressed
func _on_DownButton_pressed():
	current_number = (current_number - 1) % 10  # Decrement and wrap around at 0
	if current_number < 0:
		current_number = 9  # Ensure it wraps to 9 instead of negative
	update_number_label()
	check_code()
	
func _on_DownButton2_pressed():
	current_number2 = (current_number2 - 1) % 10  # Decrement and wrap around at 0
	if current_number2 < 0:
		current_number2 = 9  # Ensure it wraps to 9 instead of negative
	update_number_label()
	check_code()
	
func _on_DownButton3_pressed():
	current_number3 = (current_number3 - 1) % 10  # Decrement and wrap around at 0
	if current_number3 < 0:
		current_number3 = 9  # Ensure it wraps to 9 instead of negative
	update_number_label()
	check_code()
	
func _on_DownButton4_pressed():
	current_number4 = (current_number4 - 1) % 10  # Decrement and wrap around at 0
	if current_number4 < 0:
		current_number4 = 9  # Ensure it wraps to 9 instead of negative
	update_number_label()
	check_code()

# Function to update the label with the current number
func update_number_label():
	$VBoxContainer/Label.text = str(current_number)
	$VBoxContainer2/Label.text = str(current_number2)
	$VBoxContainer3/Label.text = str(current_number3)
	$VBoxContainer4/Label.text = str(current_number4)
	
func check_code():
	var entered_code: Array = [
		current_number,
		current_number2,
		current_number3,
		current_number4
		]

	if entered_code == correct_code:
		get_tree().root.get_node("GameState").jewelry_box_open = true
		GameState.last_scene_exited="JBox"
		GameState.JBoxToBR_spawn_Alex= spawn_point_name
		GameState.JBoxToBR_spawn_Char=spawn_point_name2
		get_tree().change_scene_to_file(next_room_scene)
