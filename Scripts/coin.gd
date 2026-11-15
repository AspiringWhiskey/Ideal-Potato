extends Area2D

@export var value: int = 1
@export var bob_height: float = 5.0
@export var bob_speed: float = 4.0

@onready var sprite: Sprite2D = $Sprite2D

var time_passed: float = 0.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	time_passed = randf() * TAU
	
func _process(delta: float) -> void:
	time_passed += delta * bob_speed
	sprite.position.y = sin(time_passed) * bob_height

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Potato"):
		GameManager.add_coin(value)
		queue_free()
