class_name grass_tile
extends Area2D

const GRASS_32X_32_00 = preload("res://assets/grass/grass_32x32_00.png")
const GRASS_32X_32_01 = preload("res://assets/grass/grass_32x32_01.png")
const GRASS_8X_8_00 = preload("res://assets/grass/grass_8x8_00.png")
const GRASS_8X_8_01 = preload("res://assets/grass/grass_8x8_01.png")
const GRASS_8X_8_03 = preload("res://assets/grass/grass_8x8_03.png")
const GRASS_8X_8_04 = preload("res://assets/grass/grass_8x8_04.png")

var number_of_grass_tiles = 4
@onready var grass: Sprite2D = $Grass

var time_passed := 0.0
var state := 0  # 0 = default, 1 = changed
var mowed_bool = false

func _ready() -> void:
	
	grass.texture = GRASS_8X_8_00
	print("size:")
	print(grass.texture.get_height())

func _process(delta: float) -> void:
	if mowed_bool:
		grass.texture = GRASS_8X_8_01
	#time_passed += delta

	#if state == 0 and time_passed >= 0.5:
		#grass.texture = GRASS_32X_32_01
		#state = 1

	#elif state == 1 and time_passed >= 1.0:
		#grass.texture = GRASS_32X_32_00
		#state = 0
		#time_passed = 0.0  # Reset timer


func _on_body_entered(body: Node2D) -> void:
	mowed_bool = true
