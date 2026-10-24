extends Control
@onready var level_1: Button = %"level 1"
@onready var level_2: Button = %"level 2"
@onready var level_3: Button = %"level 3"
@onready var level_4: Button = %"level 4"
@onready var level_5: Button = %"level 5"

func _on_level_1_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		get_tree().change_scene_to_file("res://level_1.tscn")
	else:
		get_tree().change_scene_to_file("res://level_1.tscn")


func _on_level_2_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		pass
	else:
		get_tree().change_scene_to_file("res://level_2.tscn")

func _on_level_3_pressed() -> void:
	if LevelCore.lvl2_completed == false:
		pass
	else:
		get_tree().change_scene_to_file("res://level_3.tscn")

func _on_level_4_pressed() -> void:
	if LevelCore.lvl3_completed == false:
		pass
	else:
		get_tree().change_scene_to_file("res://level_4.tscn")


func _on_level_5_pressed() -> void:
	if LevelCore.lvl4_completed == false:
		pass
	else:
		get_tree().change_scene_to_file("res://level_5.tscn")
