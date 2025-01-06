extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for hidblock in get_tree().get_nodes_in_group("Hidden Block"):
			hidblock.visible = false
			hidblock.get_node("CollisionShape2D").set_deferred("disabled", true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Blocks'):
		for hidblock in get_tree().get_nodes_in_group("Hidden Block"):
			hidblock.visible = true
			hidblock.get_node("CollisionShape2D").set_deferred("disabled", false)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group('Blocks'):
		for hidblock in get_tree().get_nodes_in_group("Hidden Block"):
			hidblock.visible = false
			hidblock.get_node("CollisionShape2D").set_deferred("disabled", true)
