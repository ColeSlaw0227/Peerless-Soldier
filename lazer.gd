extends CharacterBody2D
var curtime = 0
var attackdamage = 2
func _start():
	look_at(get_global_mouse_position())
func _process(delta):
	if  curtime > 0.2:
		queue_free()
	curtime += delta
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit")
	if body.is_in_group("Player"):
		body.take_damage(2)
