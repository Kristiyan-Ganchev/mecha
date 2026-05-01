extends RayCast3D

@onready var root: BoneAttachment3D = $"../Skeleton3D/Root"
@onready var target_sphere: CSGSphere3D = $TargetSphere

func _process(delta: float) -> void:
	global_position = root.global_position
	target_sphere.global_position = get_collision_point()
	
