extends Area2D
var value = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_in_group("LockBlock"):
		for i in get_overlapping_areas():
			if i.is_in_group("Ftrigger") && Input.is_action_pressed("space"):
				get_parent().set_freeze_enabled(false)
				value += 1;
		if value <= 0:
			get_parent().set_freeze_enabled(true)
		value = 0
	else:
		get_parent().set_freeze_enabled(true)

func _on_freezer_helper_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player1"):
		add_to_group("LockBlock")


func _on_freezer_helper_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player1"):
		remove_from_group("LockBlock")
