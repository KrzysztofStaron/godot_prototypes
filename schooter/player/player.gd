extends KinematicBody2D

export var speed := 80

onready var gun := $gun

func _process(_delta: float) -> void:
	var dir := MoveInput.vector("move_left", "move_right", "move_up", "move_down")
	# warning-ignore:RETURN_VALUE_DISCARDED 
	move_and_slide(dir * speed)

	var mouse_pos := get_local_mouse_position()
	gun.rotation = atan2(mouse_pos.y, mouse_pos.x)
