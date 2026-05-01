extends CharacterBody3D

@onready var input_gatherer: InputGatherer = $Input
@onready var model: PlayerModel = $Model
@onready var visuals: Node3D = $Visuals as PlayerVisuals
@onready var camera_mount = $CameraMount

func _ready() -> void:
	visuals.accept_skeleton(model.skeleton)
		
func _physics_process(delta: float) -> void:
	var input = input_gatherer.gather_input()
	model.update(input, delta)
	input.queue_free()
