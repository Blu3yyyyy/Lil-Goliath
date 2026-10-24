extends Node2D


@onready var flip_root: Node2D = $FlipRoot

func flip_nodes(is_left: bool) -> void:
	flip_root.scale.x = -1 if is_left else 1
