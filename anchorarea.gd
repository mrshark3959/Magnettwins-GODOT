extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_entered_exited(area: Area2D) -> void:
	#print(get_overlapping_areas().size())
	if  get_overlapping_areas().size() > 0 && Input.is_action_pressed("space"):
		get_parent().set_freeze_enabled(false)
		#print("LIGHT YAGAMI")
		get_parent().set_collision_layer_value(1, false)
		get_parent().set_gravity_scale(1)
		get_parent().linear_velocity  = Vector2.ZERO
	else:
		get_parent().set_freeze_enabled(true)
		get_parent().set_gravity_scale(0)
		get_parent().linear_velocity  = Vector2.ZERO
	if !Input.is_action_pressed("space"):
		get_parent().set_collision_layer_value(1, true)
func _on_area_exited(area: Area2D) -> void:
	call_deferred('_on_area_entered_exited', area)
func _on_area_entered(area: Area2D) -> void:
	call_deferred('_on_area_entered_exited', area)
