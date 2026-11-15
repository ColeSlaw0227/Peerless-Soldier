extends CharacterBody2D

@export var musicOn = false
@export var player_speed = 300.0
@export var feetspeed = 4
@export var scene1 = false
@export var scene2 = false
@export var attackspeed = 0.05
func _ready() -> void:
	timer.wait_time = attackspeed
	timer.one_shot = true
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
var timer = 0.0
func _physics_process(delta: float):
	var input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = input_direction * player_speed
	move_and_slide()
	$ForwardPlayer.visible = false
	$RightPlayer.visible = false
	$LeftPlayer.visible = false
	$BackwardsPlayer.visible = false
	$ForwardPlayer2.visible = false
	$RightPlayer2.visible = false
	$LeftPlayer2.visible = false
	$BackwardsPlayer2.visible = false
	var count = int(timer * feetspeed)
	if input_direction:
		if velocity.y == 0:
			if velocity.x == 0:
				$ForwardPlayer.visible = true
			else: if velocity.x > 0:
				if fmod(count, 2) == 0:
					$RightPlayer.visible = true
				else:
					$RightPlayer2.visible = true
			else: if velocity.x < 0:
				if fmod(count, 2) == 0:
					$LeftPlayer.visible = true
				else:
					$LeftPlayer2.visible = true
		else: if velocity.y > 0:
			if fmod(count, 2) == 0:
				$ForwardPlayer.visible = true
			else:
				$ForwardPlayer2.visible = true
		else: if velocity.y < 0:
			if fmod(count, 2) == 0:
				$BackwardsPlayer.visible = true
			else:
				$BackwardsPlayer2.visible = true
	else:
		$ForwardPlayer.visible = true
	if musicOn == true && $BackroundMusic.is_playing() == false:
		$BackroundMusic.play()
	timer += delta
	if Input.is_action_just_pressed("roll"):
		velocity = velocity * 10
		print("Rolled")
		move_and_slide()
	if scene1 == true && get_tree().current_scene.name != "res://entry_room.tscn":
		get_tree().change_scene_to_file("res://entry_room.tscn")
	if scene2 == true && get_tree().current_scene.name != "res://boss_room.tscn":
		get_tree().change_scene_to_file("res://boss_room.tscn")
func _on_timer_timeout():
	if (timeelapsed < 10) || (timeelapsed < 60 && timeelapsed > 50) || (timeelapsed < 110 && timeelapsed > 100):
		var newBullet = BOSS_BULLET.instantiate()
		newBullet.position = Vector2(0,0)
		newBullet.rotation = bulletrot1
		add_child(newBullet)
		bulletrot1 += PI/6
