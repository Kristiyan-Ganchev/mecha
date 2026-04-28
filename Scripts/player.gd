extends CharacterBody3D

@onready var input_gatherer: InputGatherer = $Input
@onready var model: PlayerModel = $Model

func _physics_process(delta: float) -> void:
	var input = input_gatherer.gather_input()
	model.update(input, delta)
