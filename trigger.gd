extends Area2D
var snapbody = null;
var positiveType = true;
var positiveMode = true;
@onready var magnetism_sfx: AudioStreamPlayer = $"../magnetism-sfx"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if name == 'TriggerNegitive': 
		positiveType = false;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed('e')):
		positiveMode = !positiveMode
	if positiveType == positiveMode:
		set_gravity(4000)
		if (Input.is_action_pressed("space")):
			gravity_space_override = SPACE_OVERRIDE_REPLACE
			if get_node("Pulse").animation != "pulse":
				get_node("Pulse").play("pulse")
				#print("hi")
		else:
			gravity_space_override = SPACE_OVERRIDE_DISABLED
			if get_node("Pulse").animation == "pulse":
				get_node("Pulse").animation = "default"
				#print("bye") 
			magnetism_sfx.stop()
	else:
		set_gravity(-2500)
		if (Input.is_action_pressed("space")):
			gravity_space_override = SPACE_OVERRIDE_REPLACE
			if get_node("Pulse").animation != "pulse":
				get_node("Pulse").play("pulse")
				#print("hi")
		else:
			gravity_space_override = SPACE_OVERRIDE_DISABLED
			if get_node("Pulse").animation == "pulse":
				get_node("Pulse").animation = "default"
				#print("bye")
	get_node("CollisionShape2D").disabled = true
	get_node("CollisionShape2D").set_deferred("disabled", false)

func _physics_process(delta: float) -> void:
	for body in get_overlapping_bodies():
		if body is RigidBody2D:
			body.apply_central_impulse(Vector2(0.1, 0.1))
			if Input.is_action_pressed("space") and not magnetism_sfx.playing:
				magnetism_sfx.play();
				print("working")


func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		magnetism_sfx.play();
		body.apply_central_impulse(Vector2(0.1, 0.1))
