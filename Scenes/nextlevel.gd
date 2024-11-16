extends Area2D

# LEVELS MUST BE NAMED "level_(NUMBER OF LEVEL) ex: level_1
const FILE_BEGIN = "res://levels/level_"
@onready var sprite = $OpenClose  # Access the AnimatedSprite2D node
@onready var timer = $Timer  # Timer node for delays
var next_level_path = ""  # Store the path to the next level

func _on_area_entered(area: Area2D) -> void:
	# Ensure the player is in the "Player" group
	if area.is_in_group("Player"):
		print("Touched")
		
		# Calculate the next level path
		var current_scene_file = get_tree().current_scene.scene_file_path
		var level_number = int(current_scene_file.replace(FILE_BEGIN, "").replace(".tscn", ""))
		next_level_path = FILE_BEGIN + str(level_number + 1) + ".tscn"
		
		# Play the "Elevator Open" animation
		sprite.play("Elevator Open")
		print("Playing 'Elevator Open' animation.")



func _on_open_close_animation_finished() -> void:
	# Check which animation has just finished
	if sprite.animation == "Elevator Open":
		print("'Elevator Open' finished. Now playing 'Elevator Close'.")
		sprite.play("Elevator Close")
		if sprite.animation == "Elevator Close":
			print("'Elevator Close' finished. Changing to next level.")
			get_tree().change_scene_to_file(next_level_path)
