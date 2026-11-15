extends CanvasLayer

@export var full_heart_texture: Texture2D
@export var dead_heart_texture: Texture2D

@onready var hearts_container: HBoxContainer = $HeartsContainer

func _ready() -> void:
	update_hearts(GameManager.hearts)
	GameManager.hearts_updated.connect(update_hearts)

func update_hearts(current_hearts: int) -> void:
	var heart_icons := hearts_container.get_children()
	for i in range(heart_icons.size()):
		if i < current_hearts:
			heart_icons[i].texture = full_heart_texture
		else:
			heart_icons[i].texture = dead_heart_texture
