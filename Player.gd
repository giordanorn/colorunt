extends KinematicBody


export var speed:int = 1

var direction = Vector3.ZERO

func _ready():
	$MeshInstance.get_surface_material(0).albedo_color = Color(1,0,1)

func _process(delta) -> void:
	if Input.is_action_pressed("ui_up"):
		direction = Vector3.UP
	elif Input.is_action_pressed("ui_left"):
		direction = Vector3.LEFT
	elif Input.is_action_pressed("ui_right"):
		direction = Vector3.RIGHT
	elif Input.is_action_pressed("ui_down"):
		direction = Vector3.DOWN
	else:
		direction = Vector3.ZERO
	
	move(delta)

func move(delta) -> void:
	translation = ((speed * delta) * direction) + translation
