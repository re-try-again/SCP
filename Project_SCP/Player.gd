extends CharacterBody2D

var MAX_SPEED = 100

func _physics_process(delta):
	var velocity = Vector2.ZERO
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector
	else:
		velocity = Vector2.ZERO

	move_and_collide(velocity * delta * MAX_SPEED)