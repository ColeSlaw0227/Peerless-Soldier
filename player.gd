extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = input_direction * SPEED
	move_and_slide()


	move_and_slide()
