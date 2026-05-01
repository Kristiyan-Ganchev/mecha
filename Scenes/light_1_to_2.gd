extends Combo

@onready var light1 = $".." as Light1

const PANIC_CLICK_PREVENTION = 0.1

func _ready():
	triggered_move = "light2"


func is_triggered(input : InputPackage):
	if input.actions.has("light1") and light1.works_longer_than(PANIC_CLICK_PREVENTION):
		return true
	return false
