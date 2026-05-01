extends State
class_name Light1

const COMBO_TIMING = 0.97
const TRANSITION_TIMING = 1.1333

func _ready():
	animation = "Hook"
	state_name = "light1"

func check_relevance(input : InputPackage):
	check_combos(input)
	if works_longer_than(COMBO_TIMING) and has_queued_state:
		has_queued_state = false
		return queued_state
	elif works_longer_than(TRANSITION_TIMING):
		input.actions.sort_custom(state_priority_sort)
		return input.actions[0]
	else:
		return "okay"

func on_enter_state():
	player.velocity = Vector3.ZERO
