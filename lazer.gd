extends CharacterBody2D
var curtime = 0
var attackdamage = 2
func _start():
	look_at(get_global_mouse_position())
func _process(delta):
	if  curtime > 0.2:
		queue_free()
	curtime += delta
func _physics_process(delta: float) -> void:
	var collisionresult =  move_and_collide(0 * delta * Vector2.ZERO)
	if collisionresult != null:
		var whatcollided = collisionresult.get_collider()
		if whatcollided.is_in_group("Player"):
			if whatcollided.has_method("take_damage"):
				whatcollided.take_damage(attackdamage)
		queue_free()
