extends State
class_name Idle

func _ready() -> void:
	animation = "IdleAnimation"

func check_relevance(input) -> String:
	input.actions.sort_custom(state_priority_sort)
	return input.actions[0]

func on_enter_state():
	player.velocity = Vector3.ZERO
