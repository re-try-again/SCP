extends StaticBody2D

func _ready():
	# Connect to the AnimationPlayer node
	var animation_player = $AnimationBush
	
	# Play the animation named "MyAnimation" (change to your animation name)
	animation_player.play("Bush_Idle")
