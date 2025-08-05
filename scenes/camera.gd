extends Camera2D

var zoom_speed = 0.1

func _unhandled_input(event):
	if event.is_action_pressed("zoom_in"):
		zoom.x -= zoom_speed
		zoom.y -= zoom_speed
	elif event.is_action_pressed("zoom_out"):
		zoom.x += zoom_speed
		zoom.y += zoom_speed
		zoom = clamp(zoom, Vector2(0.25, 0.25), Vector2(2.0, 2.0)) #Optional zoom limits
		
