extends Area

export var color:Color=Color(0,0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$MeshInstance.get_surface_material(0).albedo_color = color
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Paint_body_entered(body):
	if body.is_in_group("player"):
		print("AEEEEE")
	pass # Replace with function body.
