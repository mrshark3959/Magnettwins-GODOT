extends Area2D
var value = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in get_overlapping_areas():
		if i.is_in_group("Ftrigger") && Input.is_action_pressed("space"):
			get_parent().set_freeze_enabled(false)
			value += 1;
	if value <= 0:
		get_parent().set_freeze_enabled(true)
	value = 0
	for i in get_parent().get_node("FreezerHelper").get_overlapping_bodies():
		if i.is_in_group("Player1"):
			get_parent().set_freeze_enabled(true)
