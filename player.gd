extends CharacterBody2D


@export var player_speed = 300.0



func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = input_direction * player_speed
	move_and_slide()
