extends Node2D


var speed := 150
var angle : float

func _process(delta: float) -> void:
	set_position(position + Vector2(speed, 0).rotated(angle + get_rotation()) * delta)