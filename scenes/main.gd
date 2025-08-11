extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$mower_menu/Panel/Mowed_units.text = str(Godscript.mow_distance)


func _on_mow_baby_open_mower_menu() -> void:
	$mower_menu.visible = true


func _on_close_pressed() -> void:
	$mower_menu.visible = false
	
