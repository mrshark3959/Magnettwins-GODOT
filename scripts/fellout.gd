extends Area2D





func respawn():
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
