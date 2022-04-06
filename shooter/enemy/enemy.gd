extends KinematicBody2D

class_name Enemy

var health := 100

func take_damage(count : int):
	health -= count
	if health <= 0:
		queue_free()
