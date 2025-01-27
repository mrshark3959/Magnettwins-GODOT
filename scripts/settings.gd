extends Button

@onready var settings = $"../settingsmenu"


func _on_pressed() -> void:
	$"../click".play()
	settings.show()
