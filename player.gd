extends CharacterBody2D


@export var player_speed = 300.0



func _physics_process(delta: float):
	var input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = input_direction * player_speed
	move_and_slide()
	print(velocity)
	$ForwardPlayer.visible = false
	$RightPlayer.visible = false
	$LeftPlayer.visible = false
	$BackwardsPlayer.visible = false
	$ForwardPlayer2.visible = false
	$RightPlayer2.visible = false
	$LeftPlayer2.visible = false
	$BackwardsPlayer2.visible = false
	if velocity.y == 0:
		if velocity.x == 0:
			$ForwardPlayer.visible = true
		else: if velocity.x > 0:
			if fmod(delta, 2) >= 0:
				$RightPlayer.visible = true
			else:
				$RightPlayer2.visible = true
		else: if velocity.x < 0:
			if fmod(delta, 2) >= 0:
				$LeftPlayer.visible = true
			else:
				$LeftPlayer2.visible = true
	else: if velocity.y > 0:
		if fmod(delta, 2) >= 0:
			$ForwardPlayer.visible = true
		else:
			$ForwardPlayer2.visible = true
	else: if velocity.y < 0:
		if fmod(delta, 2) >= 0:
			$BackwardsPlayer.visible = true
		else:
			$BackwardsPlayer2.visible = true
