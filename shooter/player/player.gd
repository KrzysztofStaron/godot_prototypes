extends KinematicBody2D

export var speed := 80
export var bullet : PackedScene

var canShoot := true

onready var gun := $gun

func _process(_delta: float) -> void:
	var dir := MoveInput.vector("move_left", "move_right", "move_up", "move_down")
	# warning-ignore:RETURN_VALUE_DISCARDED 
	move_and_slide(dir * speed)

	var mouse_pos := get_local_mouse_position()
	gun.rotation = atan2(mouse_pos.y, mouse_pos.x)

func shoot():
	canShoot = false
	var new_bullet := bullet.instance()
	new_bullet.set_position(get_position())
	get_node("..").add_child(new_bullet)

	var mouse_pos := get_local_mouse_position()
	var angle := atan2(mouse_pos.y, mouse_pos.x)
	
	new_bullet.angle = angle
	print(angle)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		if canShoot:
			shoot()


func _on_shoot_timer_timeout() -> void:
	canShoot = true
