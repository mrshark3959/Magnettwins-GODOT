extends Area2D
var snapbody = null;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_pressed("space")):
		set_gravity_space_override_mode(Area2D.SPACE_OVERRIDE_REPLACE)
		if get_node("Pulse").animation != "pulse":
			get_node("Pulse").play("pulse")
			#print("hi")
	else:
		set_gravity_space_override_mode(Area2D.SPACE_OVERRIDE_DISABLED)
		if get_node("Pulse").animation == "pulse":
			get_node("Pulse").animation = "default"
			#print("bye")
	if snapbody is RigidBody2D && Input.is_action_pressed("space"):
		
		snapbody.global_transform.origin = global_position
		snapbody.linear_velocity = Vector2(0,0)
		set_gravity_space_override_mode(Area2D.SPACE_OVERRIDE_DISABLED)
	else: 
		if snapbody is RigidBody2D:
			snapbody.freeze = false
		snapbody = null


func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		body.apply_central_impulse(Vector2(0.1, 0.1))


func _on_snap_body_entered(body: Node2D) -> void:
	if Input.is_action_pressed("space") && snapbody == null && gravity_space_override == Area2D.SPACE_OVERRIDE_REPLACE:
		snapbody = body
