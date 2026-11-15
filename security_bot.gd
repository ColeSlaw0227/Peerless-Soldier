extends CharacterBody2D
const BOSS_BULLET = preload("res://boss_bullet.tscn")
@onready var timer: Timer = $BulletTimer
@export var bulletspawns = 0.2
@export var boss_max = 100
var boss_health = boss_max
var bulletrot1 = 0
var bulletrot2 = PI
var timeelapsed = 0
func _ready() -> void:
	timer.wait_time = bulletspawns
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
func _on_timer_timeout():
	if (timeelapsed < 10) || (timeelapsed < 60 && timeelapsed > 50) || (timeelapsed < 110 && timeelapsed > 100):
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
	timeelapsed += bulletspawns
