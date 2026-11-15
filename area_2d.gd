extends Area2D

@export var bulletspeed = 1.0
@onready var player = $EntryRoom/Player
var xmov = 0.0
var ymov = 0.0
var facing = rotation_degrees + 90
var player_pos = player.global_position
func _physics_process(delta: float) -> void:
	xmov = cos(facing) * bulletspeed * delta
	ymov = sin(facing) * bulletspeed * delta
	translate(Vector2(xmov,ymov))
	print(player_pos)
