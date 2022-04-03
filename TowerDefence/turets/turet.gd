extends Node
class_name Turet

var atack_range : int 
var atack_speed : float

var bullet : String

func _ready () -> void:
	var atack_timer := $atack_timer

	atack_timer.wait_time = atack_speed

	var err := atack_timer.connect ("timeout", self, "_atack")
	if err != OK:
		print("Timer node didn't find")

func _atack () -> void:
	print ("atacked")
