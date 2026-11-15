extends Control

@onready var menu_button: BaseButton = $Button

func _ready() -> void:
	menu_button.pressed.connect(_on_menu_button_pressed)

func _on_menu_button_pressed() -> void:
	GameManager.reset_game()
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
