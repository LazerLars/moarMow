extends Node
const GRASS_TILE = preload("res://scenes/grass_tile.tscn")
const GRASS_STRAW = preload("res://scenes/grass_straw.tscn")
@onready var grass_manager: Node = $"."
#@onready var grass_straws_manager: Node = $grass_straws_manager  # ✅ Correct


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size = get_viewport().get_visible_rect().size
	var width = screen_size.x
	var height = screen_size.y
	
	# set thie size of the grass tiles
	var tile_size = Vector2(8, 8)  # assuming tile is 32x32, adjust if needed
	
	# calculate how many columns and rows of grass tiles we need to draw to fill the screen
	var cols = int(screen_size.x / tile_size.x) + 1
	var rows = int(screen_size.y / tile_size.y) + 1

	# draw the grass tiles
	for y in rows:
		for x in cols:
			var grass_obj = GRASS_TILE.instantiate()
			grass_obj.position = Vector2(x * tile_size.x, y * tile_size.y)
			# we need to set z index -1 in order to make the mower visible on the screen
			grass_obj.z_index = -1

			grass_manager.add_child(grass_obj)
	
	# draw some grass straws
	for i in 50:
		var grass_straw_obj = GRASS_STRAW.instantiate()
		grass_straw_obj.position = Vector2(randi_range(10, width), randi_range(10, height))
		grass_straw_obj.z_index = - 1
		
		grass_manager.add_child(grass_straw_obj)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
