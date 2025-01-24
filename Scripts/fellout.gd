extends Area2D

@onready var sound = $"../fallensound"
@onready var timer = $"../Timer"  # Make sure the Timer node exists in your scene
var is_respawning = false  # Flag to track if respawn is already in progress

func respawn():
	if is_respawning:
		return  # Exit if respawn is already happening

	is_respawning = true  # Set the flag to true
	sound.play()
	timer.start()  # Start the timer with a 0.2-second delay

func _on_timer_timeout():
	# This function is called when the timer finishes
	var retree = get_tree()
	retree.call_deferred("reload_current_scene")

func _on_area_entered(area: Area2D) -> void:
	print(area.name)
	if "Snap" in area.name or "Trigger" in area.name:
		print("ferrus trigger detected")
	elif "ferrusarea" in area.name:
		respawn()	
	else:
		print("Something has fallen")
		respawn()

func _on_body_entered(body: RigidBody2D) -> void:
	respawn()
