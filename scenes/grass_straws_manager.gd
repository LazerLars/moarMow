extends Node
const GRASS_TILE = preload("res://scenes/grass_tile.tscn")
const GRASS_STRAW = preload("res://scenes/grass_straw.tscn")
@onready var grass_straws_manager: Node = $"."
#@onready var grass_straws_manager: Node = $grass_straws_manager  # ✅ Correct


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var screen_size = get_viewport().get_visible_rect().size
	var width = screen_size.x
	var height = screen_size.y
	
	var tile_size = Vector2(8, 8)  # assuming tile is 32x32, adjust if needed

	var cols = int(screen_size.x / tile_size.x) + 1
	var rows = int(screen_size.y / tile_size.y) + 1

	for y in rows:
		for x in cols:
			var grass_obj = GRASS_TILE.instantiate()
			grass_obj.position = Vector2(x * tile_size.x, y * tile_size.y)
			grass_obj.z_index = -1  # ensures it renders behind most other things

			grass_straws_manager.add_child(grass_obj)
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
