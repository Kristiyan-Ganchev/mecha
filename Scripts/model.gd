extends Node
class_name PlayerModel

@onready var player = $".."

var current_state:  State

@onready var states := {
	"idle" : $Idle,
	"walk" : $Walk,
	"jump" : $Jump
}

func _ready() -> void:
	current_state= states["idle"]
	for state in states.values():
		state.player = player

func update(input: InputPackage, delta: float):
	var relevance = current_state.check_relevance(input)
	if relevance != "okay":
		switch_to(relevance)
	current_state.update(input,delta)
	
func switch_to(state: String):
	current_state.on_exit_state()
	current_state = states[state]
	current_state.on_enter_state()
