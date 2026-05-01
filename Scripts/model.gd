extends Node
class_name PlayerModel

@onready var player = $".."
@onready var skeleton: Skeleton3D = $Skeleton3D
@onready var animator: AnimationPlayer = $AnimationPlayer

var current_state:  State

@onready var states := {
	"idle" : $States/Idle,
	"walk" : $States/Walk,
	"jump" : $States/Jump,
	"sprint" : $States/Sprint,
	"sprintJump" : $States/SprintJump,
	"midair" : $States/Midair,
	"walkLanding" : $States/WalkLanding,
	"sprintLanding" : $States/SprintLanding
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
	current_state.mark_enter_state()
	animator.play(current_state.animation)
