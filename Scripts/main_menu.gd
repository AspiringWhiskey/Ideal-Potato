extends Control

func _on_button_pressed() -> void:
	GameManager.reset_game()
	get_tree().change_scene_to_file("res://Scenes/level_01.tscn")
