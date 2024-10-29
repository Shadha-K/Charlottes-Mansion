extends Area2D

#ignal jewelry_box_interacted

@onready var label: Label = $Label
@onready var code: LineEdit = $LineEdit

func _ready():
	label.visible = false 
	code.visible = false
	
#var game_state = get_tree().root.get_node("GameState")
#code.connect("jewelry_box_interacted", Callable(game_state, "put_code_in_jewelry_box"))

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Alex" and get_tree().root.get_node("GameState").got_code:
		label.visible = true 

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Alex":
		label.visible = false  

func _process(_delta):
	if Input.is_action_just_pressed("interact") and label.visible:
		interact_with_jewelry_box()

func interact_with_jewelry_box():
	#it_signal("jewelry_box_interacted")
	#temp code
	label.text = "Put code into\njewelry box"
	code.visible = true
	code.clear()  
	code.grab_focus()  

func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text.strip_edges() == "4710":
		label.text = "Ace of Diamonds\nreceived!"
		code.visible = false  
		code.clear() 
	else:
		label.text = "Wrong Code!"
		code.clear()
	
