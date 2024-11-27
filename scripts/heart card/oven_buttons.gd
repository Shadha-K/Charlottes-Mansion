extends Control

var current_number: String = "0 : 0 0"

var correct_code: String = "1 : 4 5"

func _ready():
	$up_button.pressed.connect(_on_UpButton_pressed)
	$down_button.pressed.connect(_on_DownButton_pressed)
	
	update_number_label()

func _on_UpButton_pressed():
	increment_time(15)
	update_number_label()

func _on_DownButton_pressed():
	decrement_time(15)
	update_number_label()

func increment_time(minutes_to_add: int):
	var time_parts = current_number.split(" : ")
	var hours = int(time_parts[0])
	var minutes = int(time_parts[1].strip_edges())
	
	minutes += minutes_to_add

	while minutes >= 60:
		minutes -= 60
		hours += 1
	while minutes < 0:
		minutes += 60
		hours -= 1
	
	if hours == 1 and minutes > 45:
		minutes = 45
	elif hours > 1:
		hours = 1
		minutes = 45

	var tens = str(int(minutes / 10))
	var ones = str(minutes % 10)
	current_number = str(hours) + " : " + tens + " " + ones

func decrement_time(minutes_to_subtract: int):
	var time_parts = current_number.split(" : ")
	var hours = int(time_parts[0])
	var minutes = int(time_parts[1].strip_edges())

	if current_number == "0 : 0 0":
		return
	
	minutes -= minutes_to_subtract

	while minutes < 0:
		minutes += 60
		hours -= 1

	if hours < 0:
		hours = 0
		minutes = 0

	var tens = str(int(minutes / 10))
	var ones = str(minutes % 10)
	current_number = str(hours) + " : " + tens + " " + ones

func update_number_label():
	$Label.text = current_number
