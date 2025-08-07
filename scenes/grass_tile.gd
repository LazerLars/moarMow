extends Area2D

const GRASS_32X_32_00 = preload("res://assets/grass/grass_32x32_00.png")
const GRASS_32X_32_01 = preload("res://assets/grass/grass_32x32_01.png")

@onready var grass: Sprite2D = $Grass

var time_passed := 0.0
var state := 0  # 0 = default, 1 = changed
var mowed_bool = false

func _ready() -> void:
	grass.texture = GRASS_32X_32_00
	

func _process(delta: float) -> void:
	if mowed_bool:
		grass.texture = GRASS_32X_32_01
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
