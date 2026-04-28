extends State
class_name Idle

func check_relevance(input: InputPackage) -> String:
	input.actions.sort_custom(state_priority_sort)
	return input.actions[0]
