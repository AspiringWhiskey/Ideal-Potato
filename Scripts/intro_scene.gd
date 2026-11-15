extends Control

@export_file("*.tscn") var next_scene: String = "res://Scenes/main_menu.tscn"
@export var slide_images: Array[Texture2D] = []

@export_multiline var slide_texts: Array[String] = [
	"MR POTATOE (THE GAME)",
	"MR POTATOE lived in the field, and life was good",
	"Until one day...",
	"A Farmer dug him up!",
	"The Farmer took him",
	"All the way to his mysterious chip factory",
	"MR POTATOE thought it was a computer chip factory...",
	"But he was mistaken... And saw his friends turn into food!",
	"Mustering up all his strength, he bounced out of the factory",
	"and escaped into the wild!",
	"but his freedom was far from near..."
]

@onready var cutscene_image: TextureRect = $CutsceneImage
@onready var dialogue_label: Label = $PanelContainer/MarginContainer/DialogueLabel
@onready var next_button: BaseButton = $NextButton

var current_slide: int = 0
var typing_tween: Tween

func _ready() -> void:
	next_button.pressed.connect(_on_next_pressed)
	show_slide(current_slide)

func show_slide(index: int) -> void:
	if index < slide_images.size() and slide_images[index] != null:
		cutscene_image.texture = slide_images[index]
	
	dialogue_label.text = slide_texts[index]
	dialogue_label.visible_ratio = 0.0
	
	if typing_tween:
		typing_tween.kill()
		
	var duration: float = slide_texts[index].length() * 0.04
	typing_tween = create_tween()
	typing_tween.tween_property(dialogue_label, "visible_ratio", 1.0, duration)

func _on_next_pressed() -> void:
	if dialogue_label.visible_ratio < 1.0:
		if typing_tween:
			typing_tween.kill()
		dialogue_label.visible_ratio = 1.0
		return
		
	current_slide += 1
	if current_slide < slide_texts.size():
		show_slide(current_slide)
	else:
		get_tree().change_scene_to_file(next_scene)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		_on_next_pressed()
