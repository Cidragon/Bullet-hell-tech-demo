extends CharacterBody2D

const speed : int = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()
	pass

func _unhandled_input(event: InputEvent) -> void:
	var current_speed : Vector2 = Vector2(0,0)
	
	if Input.is_action_pressed("move_up"):
		current_speed.y = -speed
	if Input.is_action_pressed("move_down"):
		current_speed.y = speed
	if Input.is_action_pressed("move_left"):
		current_speed.x = -speed
	if Input.is_action_pressed("move_right"):
		current_speed.x = speed
	
	velocity = current_speed
