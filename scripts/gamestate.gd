extends Node

var player_health = 9
var current_health = 9
var books_picked_up: Dictionary = {}

#ace of diamonds variables
var has_teacup: bool = false
var has_water: bool = false
var got_code: bool = false
var sink_interacted: bool = false
var vanity_interacted: bool = false
var jewelry_box_open: bool = false
var code: String = "4710"
var added_diamond: bool = false
var has_diamond: bool = false 

#ace of clubs variables
var has_book: bool = false
var book_used_in_fireplace: bool = false
var has_clover: bool = false
var clover_planted: bool = false
var has_clubs: bool = false

#ace of hearts variables
var has_recipe_book: bool = false

var has_bottle: bool = false

#basement door variables
var diamond_card: bool = false
var club_card: bool = false
var first_time: bool = true

#spawn points 
var last_spawn_point_Alex = ""
var last_spawn_point_charlotte = ""
#sink spawns 
var sink_spawn_point_Alex=""
var sink_spawn_point_charlotte= ""
var last_scene_exited=""
#kitchen to living room spawn
var KtoLR_spawn_point_Alex =""
var KtoLR_spawn_point_charlotte=""
#living room to kitchen spawn
var LRtoK_spawn_Alex=""
var LRtoK_spawn_charlotte=""
#Fire place spawn
var FireToLR_spawn_Alex=""
var FireToLR_spawn_Char=""
# Function to decrease health
func decrease_health(amount):
	player_health -= amount
	player_health = max(player_health, 0)
	
#for dialogues
var start_game = true
	
#steps for ace of diamonds puzzle
func _on_teacup_picked_up():
	grab_teacup()

func grab_teacup():
	if not has_teacup:
		has_teacup = true
		print("You grabbed the teacup.")
		
func _on_filled_cup_picked_up():
	fill_teacup()

func fill_teacup():
	if has_teacup and not has_water:
		has_water = true
		print("You filled the teacup with water.")

func throw_water_on_mirror():
	if has_water and not got_code:
		got_code = true
		print("You threw water on the vanity mirror. It got foggy.")
		# Show code somehow, e.g., via UI
		show_code_to_player()

func show_code_to_player():
	print("The code is: " + code)

#steps for ace of clubs puzzle
func reset_books():
	books_picked_up.clear()
	
func _on_book_picked_up():
	grab_book()

func grab_book():
	if not has_book:
		has_book=true
		print("You grabbed the book")
		
func _on_book_thrown():
	if has_book and not book_used_in_fireplace:
		book_used_in_fireplace = true
		has_book = false  
		has_clover=true
		print("The book was thrown into the fireplace.")
		
func grab_clover():
	if not has_clover:
		has_clover=true
		print("You grabbed the book")
		
func _on_clover_picked_up():
	grab_clover()
#steps for ace of hearts puzzle
func _on_recipe_book_picked_up():
	grab_recipe_book()
	
func grab_recipe_book():
	if not has_recipe_book:
		has_recipe_book = true
		print("You grabbed the recipe book.")
		
#steps for ace of spades puzzle
func _on_bottle_picked_up():
	grab_bottle()
	
func grab_bottle():
	if not has_bottle:
		has_bottle = true
		print("You grabbed the bottle.")
