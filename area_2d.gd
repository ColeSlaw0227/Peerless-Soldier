extends CharacterBody2D

@export var bulletspeed = 100.0
@onready var timer: Timer = $BulletDespawn
@export var attackdamage = 1
var xmov = 0.0
var ymov = 0.0
var facing = 0.0
var timeofflight = 2000.0/bulletspeed
func _ready():
	facing = rotation + ((PI)/2)
	timer.wait_time = timeofflight
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
func _physics_process(delta: float) -> void:
	xmov = cos(facing) * bulletspeed * delta
	ymov = sin(facing) * bulletspeed * delta
	translate(Vector2(xmov,ymov))
	var collisionresult =  move_and_collide(bulletspeed * delta * Vector2.ZERO)
	if collisionresult != null:
		var whatcollided = collisionresult.get_collider()
		if whatcollided.is_in_group("Player"):
			if whatcollided.has_method("take_damage"):
				whatcollided.take_damage(attackdamage)
		queue_free()
func _on_timer_timeout():
	queue_free()
