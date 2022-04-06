extends Node2D


export var speed := 150
export var damage := 10

var angle : float

func _process(delta: float) -> void:
	set_position(position + Vector2(speed, 0).rotated(angle + get_rotation()) * delta)

func _on_Area2D_body_entered(body:Node) -> void:
	if body is Player:
		return
		
	if body is Enemy:
		body.take_damage(40)

	queue_free()
