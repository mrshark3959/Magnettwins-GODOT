extends Camera2D

@export var object1: NodePath
@export var object2: NodePath

var player1: Node2D
var player2: Node2D

@export var min_zoom: float = 2
@export var max_zoom: float = 2.8

var player1_in_clipping_mask: bool = false
var player2_in_clipping_mask: bool = false

func _ready():
	player1 = get_node(object1)
	player2 = get_node(object2)
	make_current()
func _process(delta):
	if (player1_in_clipping_mask and player2_in_clipping_mask) == true:
		player1 = $"../Elevator/Area2D"
		player2 = $"../Elevator/Area2D"
	# Only update the camera if BOTH players are outside the clipping mask
	if  (player1_in_clipping_mask and player2_in_clipping_mask) != true:
		var midpoint = (player1.global_position + player2.global_position) * 0.5
		self.global_position = midpoint

		var distance_x = abs(player1.global_position.x - player2.global_position.x)
		var distance_y = abs(player1.global_position.y - player2.global_position.y)

		var zoom_factor_x = distance_x / (1152 - 100)
		var zoom_factor_y = distance_y / (648 - 100)

		var zoom_factor = clamp(max(zoom_factor_x, zoom_factor_y), min_zoom, max_zoom)
		self.zoom = Vector2(zoom_factor, zoom_factor)

# Function to detect when a player enters the clipping mask
func _on_area_2d_body_entered(player: CharacterBody2D) -> void:
	if player == player1:
		player1_in_clipping_mask = true
		print("1 in clippingmask")
	elif player == player2:
		player2_in_clipping_mask = true
		print("2 in clipping mask")
# Function to detect when a player exits the clipping mask
func _on_area_2d_body_exited(player: CharacterBody2D) -> void:
	if player == player1:
		player1_in_clipping_mask = false
	elif player == player2:
		player2_in_clipping_mask = false
