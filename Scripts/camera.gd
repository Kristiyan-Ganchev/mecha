extends SpringArm3D

@onready var player = $".."

@export var mouse_sensitivity := 0.002
@export var min_pitch := -80.0 
@export var max_pitch := 30.0 
@export var camera_height := 1.5

func _ready():
	top_level = true
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	add_excluded_object(player.get_rid())

func _process(_delta):
	var offset = Vector3(0, camera_height, 0)
	global_position = player.global_position + offset

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		
		rotation.x -= event.relative.y * mouse_sensitivity
		
		rotation.x = clamp(rotation.x, deg_to_rad(min_pitch), deg_to_rad(max_pitch))
		
	if event.is_action_pressed("esc"): 
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
