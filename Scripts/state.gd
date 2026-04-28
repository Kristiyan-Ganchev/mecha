extends Node
class_name State

var player : CharacterBody3D

static var state_priority: Dictionary ={
	"idle" : 1,
	"run" : 2,
	"jump" : 10
}

static func state_priority_sort(a: String, b: String):
	if state_priority[a] > state_priority[b]:
		return true
	else:
		return false	

func check_relevance(input: InputPackage) -> String:
	print_debug("error, implement the check relevance method!")
	return "error, implement the check relevance method!"

func update(input: InputPackage, delta: float):
	pass

func on_enter_state():
	pass
	
func on_exit_state():
	pass
