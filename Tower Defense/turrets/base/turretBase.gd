extends Node2D
class_name Turret

export var bullet : PackedScene
export var shootSpeed : float
export var atackRange : int

func _on_ShootTimer_timeout() -> void:
	print("Shoot")
