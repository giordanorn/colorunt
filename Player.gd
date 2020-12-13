extends KinematicBody


export var speed:int = 1

var initial_position
var direction:Vector3 = Vector3.ZERO

const DISTANCE:float = 2.0
var distance_remaining = DISTANCE
var pos:Vector3

var moving:bool = false

func _ready():
	initial_position = translation


func _process(delta) -> void:
	if moving:
		move(delta)
	else:
		distance_remaining = DISTANCE
		pos = translation
		if set_move_direction():
			moving = true


func set_move_direction() -> bool:
	direction = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		direction = Vector3.UP
	if Input.is_action_pressed("ui_left"):
		direction = Vector3.LEFT
	if Input.is_action_pressed("ui_right"):
		direction = Vector3.RIGHT
	if Input.is_action_pressed("ui_down"):
		direction = Vector3.DOWN
	
	return direction != Vector3.ZERO




func move(delta) -> void:
	var velocity = ((speed * delta) * direction)
	move_and_collide(velocity)
	
	if direction == Vector3.RIGHT:
		if (translation - pos).x >= DISTANCE:
			moving = false
	if direction == Vector3.LEFT:
		if (pos - translation).x >= DISTANCE:
			moving = false
	if direction == Vector3.UP:
		if (translation - pos).y >= DISTANCE:
			moving = false
	if direction == Vector3.DOWN:
		if (pos - translation).y >= DISTANCE:
			moving = false
