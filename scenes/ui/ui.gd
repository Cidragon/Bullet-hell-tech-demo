extends Control

@onready var circle: CheckBox = %circle
@onready var spiral: CheckBox = %spiral
@onready var double_spiral: CheckBox = %double_spiral
@onready var four_spiral: CheckBox = %four_spiral
@onready var reversed: CheckBox = %reversed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_circle_button_up() -> void:
	if circle.button_pressed:
		spiral.button_pressed = false
		double_spiral.button_pressed = false
		four_spiral.button_pressed = false
		Global.player.current_shot = Player.SHOT_TYPE.CIRCLE


func _on_spiral_button_up() -> void:
	if spiral.button_pressed:
		circle.button_pressed = false
		double_spiral.button_pressed = false
		four_spiral.button_pressed = false
		Global.player.current_shot = Player.SHOT_TYPE.SPIRAL_ONE
		


func _on_double_spiral_button_up() -> void:
	if double_spiral.button_pressed:
		circle.button_pressed = false
		spiral.button_pressed = false
		four_spiral.button_pressed = false
		Global.player.current_shot = Player.SHOT_TYPE.SPIRAL_TWO
		


func _on_four_spiral_button_up() -> void:
	if four_spiral.button_pressed:
		circle.button_pressed = false
		spiral.button_pressed = false
		double_spiral.button_pressed = false
		Global.player.current_shot = Player.SHOT_TYPE.SPIRAL_FOUR
		


func _on_reversed_button_up() -> void:
	Global.player.is_spiral_reversed = reversed.button_pressed
