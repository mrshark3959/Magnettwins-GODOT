extends Area2D
var value: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in get_overlapping_areas():
		if i.is_in_group("Ftrigger") && Input.is_action_pressed("space"):
			print("foundy")
			value = true
	if value == false:
		print("aw")
	get_parent().set_collision_mask_value(2, value)
	get_parent().set_collision_mask_value(3, !value)
	value = false
