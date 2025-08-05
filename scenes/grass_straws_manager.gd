extends Node

const GRASS_STRAW = preload("res://scenes/grass_straw.tscn")
@onready var grass_straws_manager: Node = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size = get_viewport().get_visible_rect().size
	var width = screen_size.x
	var height = screen_size.y
	print(screen_size)
	print(width)
	print(height)
	for n in 500:
		var grass_obj = GRASS_STRAW.instantiate()
		grass_obj.position = Vector2(randi_range(10,width), randi_range(10, height))
		grass_straws_manager.add_child(grass_obj) # add uner grass_Straws_manger node
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
