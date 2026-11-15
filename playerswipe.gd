extends Area2D

@export var bulletspeed = 200.0
@onready var timer: Timer = $SwipeDespawn
var xmov = 0.0
var ymov = 0.0
var facing = 0.0
var timeofflight = 50.0/bulletspeed
func _ready():
	facing = rotation
	timer.wait_time = timeofflight
	timer.one_shot = false
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	look_at(get_global_mouse_position())
	facing  = rotation
func _physics_process(delta: float) -> void:
	xmov = cos(facing) * bulletspeed * delta
	ymov = sin(facing) * bulletspeed * delta
	translate(Vector2(xmov,ymov))

func _on_timer_timeout():
	queue_free()
