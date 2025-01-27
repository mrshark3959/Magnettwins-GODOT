extends Button


# Called when the node enters the scene tree for the first time.


func _on_pressed() -> void:
	var retree = get_tree()
	retree.call_deferred("reload_current_scene")
