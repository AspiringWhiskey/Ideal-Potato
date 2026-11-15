extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 400.0
const JUMP_VELOCITY = -1000.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	add_to_group("Potato")

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction and !is_on_floor():
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)	
	
	if position.y > 2000:
		position.y = -1.0
		position.x = 0
	
	move_and_slide()

	if direction != 0 and !is_on_floor():
		animated_sprite.play("Player Animation")
		animated_sprite.flip_h = direction < 0
	else:
		animated_sprite.pause()
