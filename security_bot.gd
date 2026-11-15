extends CharacterBody2D
const BOSS_BULLET = preload("res://boss_bullet.tscn")
const LazerCall = preload("res://lazer_call.tscn")
@export var bulletspawns = 0.2
@export var boss_max = 100
var boss_health = boss_max
var isBossDead = false
var bulletrot1 = 0
var bulletrot2 = PI
var timeelapsed = 0.0
var isAlive = true
var lazercount = 0.0
var lazergridcount = 0.0
var lazertimenum = 0
var bullettimer = 0
func _process(delta):
	if (timeelapsed < 10) || (timeelapsed < 60 && timeelapsed > 50) || (timeelapsed < 110 && timeelapsed > 100):
		if bullettimer > 0.2:
			var newBullet = BOSS_BULLET.instantiate()
			newBullet.position = Vector2(0,0)
			newBullet.rotation = bulletrot1
			add_child(newBullet)
			bulletrot1 += PI/6
			if timeelapsed > 20 && boss_health > 50:
				var newBullet2 = BOSS_BULLET.instantiate()
				newBullet2.position = Vector2(0,0)
				newBullet2.rotation = bulletrot2
				add_child(newBullet2)
				bulletrot2 += PI/6
			bullettimer = 0
		bullettimer += delta
	if (timeelapsed < 30 && timeelapsed > 10) || (timeelapsed < 80 && timeelapsed > 60) || (timeelapsed < 130 && timeelapsed > 110):
		position = ($"../Player".position) + Vector2(100,-100)
		if lazercount > 1:
			shoot_lazer(global_position.angle_to_point($"../Player".position), position)
			lazercount = 0
		lazercount += delta
	timeelapsed += delta
	if (timeelapsed < 45 && timeelapsed > 35) || (timeelapsed < 95 && timeelapsed > 85) || (timeelapsed < 145 && timeelapsed > 135):
		if lazergridcount > 1.5:
			shoot_lazergrid()
			lazergridcount = 0
		lazergridcount += delta
func shoot_lazergrid():
	shoot_lazer(PI/2, Vector2(0 + 100*lazertimenum,0))
	shoot_lazer(0, Vector2(0,0 + 100*lazertimenum))
	shoot_lazer(PI/2, Vector2(100 + 100*lazertimenum,0))
	shoot_lazer(0, Vector2(0,-1* (100 + 100*lazertimenum)))
	shoot_lazer(PI/2, Vector2(200 + 100*lazertimenum,0))
	shoot_lazer(0, Vector2(0,-1* (200 + 100*lazertimenum)))
	shoot_lazer(PI/2, Vector2(300 + 100*lazertimenum,0))
	shoot_lazer(0, Vector2(0,-1* (300 + 100*lazertimenum)))
	shoot_lazer(PI/2, Vector2(400 + 100*lazertimenum,0))
	shoot_lazer(0, Vector2(0,-1* (400 + 100*lazertimenum)))
	shoot_lazer(PI/2, Vector2(500 + 100*lazertimenum,0))
	shoot_lazer(0, Vector2(0,-1* (500 + 100*lazertimenum)))
	shoot_lazer(PI/2, Vector2(600 + 100*lazertimenum,0))
	shoot_lazer(0, Vector2(0,-1* (600 + 100*lazertimenum)))
	shoot_lazer(PI/2, Vector2(700 + 100*lazertimenum,0))
	shoot_lazer(0, Vector2(0,-1* (700 + 100*lazertimenum)))
	shoot_lazer(PI/2, Vector2(800 + 100*lazertimenum,0))
	shoot_lazer(0, Vector2(0,-1* (800 + 100*lazertimenum)))
	lazertimenum += 1
	if lazertimenum == 1:
		lazertimenum = 0
func shoot_lazer(angle: float, place: Vector2):
	var newLazer = LazerCall.instantiate()
	newLazer.position = place
	newLazer.rotation = angle
	add_sibling(newLazer)
func take_damage(damagetaken: int):
	boss_health -= damagetaken
	if boss_health <= 0:
		boss_death()
	$Hitsound.play()
	$BossHealthBar/BossHealthAmount.translate(Vector2(-0.48/2.5,0))
	$BossHealthBar/BossHealthAmount.scale.x = 0.089 * (boss_health/float(boss_max))

func boss_death():
	print("death")
	$"../Player".onBossDeath()
	
	$SecurityBotSprite.visible = false
	queue_free()
	
