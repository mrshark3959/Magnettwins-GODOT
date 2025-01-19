extends Area2D

# Constants for level file naming
const FILE_BEGIN = "res://loadingscenes/loadingscreen_"

@onready var sprite = $OpenClose  # AnimatedSprite2D node for the elevator
var next_level_path = ""  # Store the path to the next level
# Variables to track player presence in the elevator
var player1_in_elevator = false
var player2_in_elevator = false
@onready var clippingmask = $"Clipping Mask"
func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Player1"):
		player1_in_elevator = true
		print("Player 1 entered the elevator.")
	elif area.is_in_group("Player2"):
		
		player2_in_elevator = true
		print("Player 2 entered the elevator.")
	
	if player1_in_elevator and player2_in_elevator:
		print("Both players in elevator. Freezing movement.")
		_freeze_players()
		_play_elevator_animation()

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group("Player1"):
		player1_in_elevator = false
		print("Player 1 exited the elevator.")
	if area.is_in_group("Player2"):
		player2_in_elevator = false
		print("Player 2 exited the elevator.")

func _freeze_players():
	for player in get_tree().get_nodes_in_group("Player"):
		if player.has_method("freeze"):
			player.freeze()

func _unfreeze_players():
	for player in get_tree().get_nodes_in_group("Player"):
		if player.has_method("unfreeze"):
			player.unfreeze()
		
func _play_elevator_animation() -> void:
	var current_scene_file = get_tree().current_scene.scene_file_path
	var level_number = int(current_scene_file.replace(FILE_BEGIN, "").replace(".tscn", ""))
	if level_number == 0:
		next_level_path = FILE_BEGIN + "2.tscn"
	else:
		next_level_path = FILE_BEGIN + str(level_number + 1) + ".tscn"
		sprite.play("Elevator Open")
		print("Playing 'Elevator Open' animation.")

func _on_open_close_animation_finished() -> void:
	if sprite.animation == "Elevator Open":
		for player in get_tree().get_nodes_in_group("Player"):
			player.get_parent().remove_child(player)  # Detach from current parent
			clippingmask.add_child(player)  # Add to the clipping mask
			player.position -= clippingmask.global_position 
		sprite.play("Elevator Close")
		clippingmask.play("ClippingMaskClose")
	elif sprite.animation == "Elevator Close": 
		for player in get_tree().get_nodes_in_group("Player"):
			player.visible = false
		
		get_tree().change_scene_to_file(next_level_path)
	
