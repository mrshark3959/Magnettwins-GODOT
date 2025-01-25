extends Camera2D

# Export NodePaths for the two players
@export var object1: NodePath
@export var object2: NodePath

# References to the player nodes
var player1: Node2D
var player2: Node2D

# Zoom limits
@export var min_zoom: float = 2
@export var max_zoom: float = 2.8

# Track if players are in the clipping mask
var player1_in_clipping_mask: bool = false
var player2_in_clipping_mask: bool = false

func _ready():
	# Get the player nodes from the exported NodePaths
	player1 = get_node(object1)
	player2 = get_node(object2)

func _process(delta):
	# Only follow players if they are not in the clipping mask
	if not player1_in_clipping_mask and not player2_in_clipping_mask:
		# Calculate the midpoint between the two players
		var midpoint = (player1.global_position + player2.global_position) * 0.5
		self.global_position = midpoint

		# Calculate the zoom factor based on the distance between the players
		var distance_x = abs(player1.global_position.x - player2.global_position.x)
		var distance_y = abs(player1.global_position.y - player2.global_position.y)

		# Normalize the distance by the screen size (1152x648 in this case)
		var zoom_factor_x = distance_x / (1152 - 100)
		var zoom_factor_y = distance_y / (648 - 100)

		# Use the larger zoom factor and clamp it within the min/max zoom limits
		var zoom_factor = clamp(max(zoom_factor_x, zoom_factor_y), min_zoom, max_zoom)

		# Apply the zoom
		self.zoom = Vector2(zoom_factor, zoom_factor)

# Function to handle when a player enters the clipping mask
func _on_area_2d_body_entered(player: CharacterBody2D) -> void:
	if player == player1:
		player1_in_clipping_mask = true
	elif player == player2:
		player2_in_clipping_mask = true
