class_name SceneTrigger extends Area2D

@export var destination_level_tag = "boss_level"

@onready var spawn = $Spawn
var scene_folder = "res://"

func _on_body_entered(portal):
	var full_path = "res://boss_room.tscn"
	var scene_tree = get_tree()
	scene_tree.change_scene_to_file(full_path)
