extends Node2D

# Flag to track if the level has been loaded
var level_loaded = false

# Called when the node enters the scene tree for the first time
func _ready() -> void:
	if not level_loaded:
		# Change to the loading screen if it hasn't been loaded yet
		get_tree().change_scene_to_file("res://loadingscenes/loadingscreen_2.tscn")
		level_loaded = true  # Set the flag to true so it doesn't go back to the loading screen again
	else:
		# If level has already been loaded, do nothing (or load the next level, etc.)
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta: float) -> void:
	pass
