class_name mower
extends CharacterBody2D

var speed: float = 100
var turn_rotation: int = 60
#var direction: Vector2 = Vector2.ZERO

var direction = 1
var rotate = false

func _ready():
	randomize()
	var screen_size = get_viewport().get_visible_rect().size
	var width = screen_size.x
	var height = screen_size.y
	position = Vector2(randi_range(32, width), randi_range(32, height))
	rotation = randi_range(0,360)
	#direction = Vector2(randf_range(-1.0, 1.0), randf_range(-1.0, 1.0)).normalized()
	
	
	
func _process(delta: float) -> void:
	#pass
	
	#velocity = direction * speed
	if rotate == true:
		rotation_degrees += turn_rotation * delta  # x degrees per second
	
	#velocity.x = direction * speed
	if direction != 0:
		velocity = Vector2.RIGHT.rotated(rotation) * speed * direction
	else:
		velocity = Vector2.ZERO
	# this makes us move all the time
	move_and_slide()

func hitObstacle():
	# we hit a obstacle
	print("im called from above")
	# if direction is 1, we are driving forward, and now we want to set it to reverse
	if direction == 1:
		direction = -1
	# now its time to start the reverse timer
	$reverseTimer.wait_time = randf_range(0.2,0.5)
	$reverseTimer.start()

func _on_reverse_timer_timeout() -> void:
	# we keep reversing since we set direction to -1 in hitObstacle()
	print("reverse timer")
	# once the reverse timer timedout we know its now time to start rotating
	# so we set the direction to 0 so we top moving
	direction = 0
	# now  we start the rotation
	$rotateTimer.start()
	# allow rotation
	print("Lets spin this baby")
	rotate = true
	random_rotation(-180,180)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	print("move backwards")
	if direction == 1:
		direction = -1
		# start reverse timer to control how long time we want to reverse
		$reverseTimer.start()

func _on_rotate_timer_timeout() -> void:
	print("stop rotating ma dudes, and start mowing forward comrade! leeeegooo")
	# stop the rotating
	rotate = false
	# set direction so we start moving forward
	direction = 1
	# once this is done it dont keep the rotation angle? how to fix that
	
func random_rotation(x_degree:int = -360, y_degree:int = 360) -> void:
	turn_rotation = randi_range(x_degree, y_degree)
	print("new rotation degrees set set: ", str(turn_rotation))

	
