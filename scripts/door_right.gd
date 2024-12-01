extends Area2D

var next_room_scene = "res://kitchen.tscn" 
var player_near_door = false 
var spawn_point_name = "LRtoKAlexSpawn"
var spawn_point_name2 = "LRtoKCharSpawn"

@onready var press_e_label = $Label 

func _ready():
	press_e_label.visible = false

func _on_body_entered(body):
	if body.name == "Alex": 
		player_near_door = true
		press_e_label.visible = true
			
func _on_body_exited(body):
	if body.name == "Alex":
		player_near_door = false
		press_e_label.visible = false

func _process(_delta):
	if player_near_door and Input.is_action_just_pressed("interact"):
		# Play the door opening sound effect
		var sound_player = AudioStreamPlayer.new()
		sound_player.stream = load("res://assets/sound_effects/door-opening-sound-effect.mp3")
		get_tree().get_root().add_child(sound_player)
		sound_player.play()
		# Optional: Clean up the sound player after it finishes playing
		sound_player.finished.connect(sound_player.queue_free)
		# Change to the next scene
		GameState.LRtoK_spawn_Alex = spawn_point_name
		GameState.LRtoK_spawn_charlotte = spawn_point_name2
		get_tree().change_scene_to_file(next_room_scene)
