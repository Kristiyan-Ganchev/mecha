extends Node
class_name State

var player : CharacterBody3D

var animation : String
var state_name : String
var has_queued_state : bool = false
var queued_state : String = "none, drop error please"
var enter_state_time : float

static var state_priority: Dictionary ={
	"idle" : 1,
	"walk" : 2,
	"sprint" : 3,
	"jump" : 10,
	"sprintJump" : 10,
	"midair" : 10,
	"walkLanding" : 10,
	"sprintLanding" : 10,
	"light1" : 15,
	"light2" : 15
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

func check_combos(input : InputPackage):
	var available_combos = get_children()
	for combo : Combo in available_combos:
		if combo.is_triggered(input):
			has_queued_state = true
			queued_state = combo.triggered_move

func mark_enter_state():
	enter_state_time = Time.get_unix_time_from_system()

func get_progress() -> float:
	var now = Time.get_unix_time_from_system()
	return now - enter_state_time

func works_longer_than(time : float) -> bool:
	if get_progress() >= time:
		return true
	return false

func works_less_than(time : float) -> bool:
	if get_progress() < time: 
		return true
	return false

func works_between(start : float, finish : float) -> bool:
	var progress = get_progress()
	if progress >= start and progress <= finish:
		return true
	return false
