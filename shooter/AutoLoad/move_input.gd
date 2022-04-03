extends Node

# [negative_input_name (from Input Map), input_type]
# e.g. ["ui_left", "move_horizontal"]
var _correlations := [
	["move_left", "move_horizontal"],
	["move_up", "move_vertical"],
]

var _first_pressed : Dictionary

func axis(negative_input : String, positive_input : String, reversed : bool = false) -> int:
	var type := ""
	
	var KEY := 0
	var TYPE := 1

	var direction := 1 if !reversed else -1 

	for correlation in _correlations:
		if correlation[KEY] == negative_input:
			type = correlation[TYPE]
			if !_first_pressed.has(type):
				_first_pressed[type] = ""
			
			break

	if _first_pressed[type] != positive_input && Input.is_action_pressed(negative_input):
			_first_pressed[type] = negative_input
			return -1 * direction
	elif _first_pressed[type] != negative_input && Input.is_action_pressed(positive_input):
			_first_pressed[type] = positive_input
			return 1 * direction
	else:
		_first_pressed[type] = ""
		return 0

func vector(n1 : String, p1 : String, n2 : String, p2 : String, reversed := false) -> Vector2:
	var dir = Vector2(axis(n1, p1, reversed), axis(n2, p2, reversed))
	if abs(dir.x) + abs(dir.y) > 1:
		dir = dir.normalized()
	
	return dir
	
