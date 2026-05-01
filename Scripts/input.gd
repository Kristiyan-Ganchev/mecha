extends Node
class_name InputGatherer

func gather_input() -> InputPackage:
	var new_input = InputPackage.new()
	
	new_input.input_direction = Input.get_vector("m_left","m_right","m_up","m_down")
	if new_input.input_direction != Vector2.ZERO:
		new_input.actions.append("walk")
		if Input.is_action_pressed("sprint"):
			new_input.actions.append("sprint")
	
	if Input.is_action_just_pressed("jump"):
		if new_input.actions.has("sprint"):
			new_input.actions.append("sprintJump")
		else:
			new_input.actions.append("jump")
	
	if Input.is_action_just_pressed("lightAttack"):
		new_input.combat_actions.append("lightPressed")
	
	if new_input.actions.is_empty():
		new_input.actions.append("idle")	
		
	return new_input
