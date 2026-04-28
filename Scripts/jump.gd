extends State
class_name Jump

const JUMP_VELOCITY = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func check_relevance(input: InputPackage):
	if player.is_on_floor():
		input.actions.sort_custom(state_priority_sort)
		return input.actions[0]
	return "okay"

func update(input: InputPackage, delta: float):
	player.velocity.y -= gravity *delta
	
func on_enter_state():
	player.velocity.y +=JUMP_VELOCITY
