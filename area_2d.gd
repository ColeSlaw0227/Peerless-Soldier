extends Area2D

@export var bulletspeed = 1.0
@export var bulletangle = 90
var xmov = 0.0
var ymov = 0.0
func _physics_process(delta: float) -> void:
	xmov = cos(bulletangle) * bulletspeed * delta
	ymov = sin(bulletangle) * bulletspeed * delta
	translate(Vector2(xmov,ymov))
