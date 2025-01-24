extends Button




func _on_pressed() -> void:
	$"../click".play()
	$"../Timer1".start()  # Start the timer with a 0.2-second delay

func _on_timer_1_timeout() -> void:
	get_tree().change_scene_to_file("res://loadingscenes/loadingscreen_1.tscn")
