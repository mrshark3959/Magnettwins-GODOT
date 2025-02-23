extends Area2D
var value = false
var value2 = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in get_overlapping_areas():
		if i.is_in_group("Ftrigger"):
			value = true
	for i in get_parent().get_node("FreezerHelper").get_overlapping_bodies():
		if i.is_in_group("Player1"):
			value2 = true
	if value and Input.is_action_pressed("space") and not value2:
		get_parent().set_deferred("freeze", false)
	else:
		get_parent().set_deferred("freeze", true)
	value = false
	value2 = false
