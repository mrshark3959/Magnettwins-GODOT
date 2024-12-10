extends Area2D





func respawn():
	get_tree().reload_current_scene()


func _on_area_entered(area: Area2D) -> void:
	print("Something has fallen")
	respawn()
