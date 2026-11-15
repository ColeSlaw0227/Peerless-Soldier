extends Area2D

@export var bulletspeed = 1.0
var xmov = 0.0
var ymov = 0.0
var facing = rotation_degrees + 90
func _physics_process(delta: float) -> void:
	xmov = cos(facing) * bulletspeed * delta
	ymov = sin(facing) * bulletspeed * delta
	translate(Vector2(xmov,ymov))
