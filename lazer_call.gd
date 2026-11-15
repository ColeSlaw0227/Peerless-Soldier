extends Sprite2D
const Lazer = preload("res://lazer.tscn")
var curtime = 0
func _start():
	look_at(get_global_mouse_position())
func _process(delta):
	if  curtime > 0.5:
		summon_bigboi(rotation)
		queue_free()
	curtime += delta
func summon_bigboi(angle: float):
	var newLazer = Lazer.instantiate()
	newLazer.position = position
	newLazer.rotation = angle
	add_sibling(newLazer)
