extends Control

var lvl1_completed = false
var lvl2_completed = false
var lvl3_completed = false
var lvl4_completed = false
var lvl5_completed = false


func _on_level_1_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		get_tree().change_scene_to_file("res://level_1.tscn")
	else:
		get_tree().change_scene_to_file("res://level_1.tscn")


func _on_level_2_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		null
	else:
		get_tree().change_scene_to_file("res://level_2.tscn")

func _on_level_3_pressed() -> void:
	if LevelCore.lvl2_completed == false:
		null
	else:
		get_tree().change_scene_to_file("res://level_3.tscn")

func _on_level_4_pressed() -> void:
	if LevelCore.lvl3_completed == false:
		null
	else:
		get_tree().change_scene_to_file("res://level_4.tscn")


func _on_level_5_pressed() -> void:
	if LevelCore.lvl4_completed == false:
		null
	else:
		get_tree().change_scene_to_file("res://level_5.tscn")
