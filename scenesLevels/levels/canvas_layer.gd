extends CanvasLayer

@export var camera: NodePath
var camera_node: Camera2D

func _ready():
	if camera:
		camera_node = get_node(camera) as Camera2D
	else:
		push_warning("No camera path assigned to the CanvasLayer.")

func _process(delta):
	if camera_node:
		# Move the child node (e.g., a Node2D or Control) based on the camera's position
		$RESETBUTTON.global_position = camera_node.global_position
