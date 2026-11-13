extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()

	if input_direction != Vector2.ZERO:
		animated_sprite.play("Player Animation")
	else:
		animated_sprite.stop()
		animated_sprite.frame = 0
		
	if input_direction.x != 0:
		animated_sprite.flip_h = input_direction.x < 0
