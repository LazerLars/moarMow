extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "mowBaby":
		var current_mower = body as mower
		print("hit by mower")
		#body.hitObstacle()
		current_mower.hitObstacle() # this is using classname mower, some say its best pacrtice to check it has the function before calling it, but in this case i get autocomplete and know the function exists, do you still recommend using .hasfunctiion check?
