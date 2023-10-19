extends CharacterBody2D

var ACCELERATION = 300
var MAX_SPEED = 60
var FRICTION = 350

var input_vector = Vector2(0,0)

@onready var animationPlayer = $AnimatedSprite2D/AnimationPlayer
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	if velocity == Vector2.ZERO:
		animationState.travel("Idle")
	else:
		animationState.travel("Walk")
		animationTree.set("parameters/Idle/blend_position", velocity)
		animationTree.set("parameters/Walk/blend_position", velocity)
		move_and_slide()
