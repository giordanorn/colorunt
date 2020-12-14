extends Area


export var color:Color=Color(0,0,0)

func _ready():
	$MeshInstance.get_surface_material(0).albedo_color = color

func _on_Paint_body_entered(body):
	if body.is_in_group("player"):
		if !body.get_node("MeshInstance").get_surface_material(0).albedo_color == $MeshInstance.get_surface_material(0).albedo_color:
			body.get_node("MeshInstance").get_surface_material(0).albedo_color = Color(0.6,0.6,0.6)
			body.translation = body.initial_position
			body.moving=false
	pass # Replace with function body.
