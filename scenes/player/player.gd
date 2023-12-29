extends CharacterBody2D

const speed : int = 400
const radius : int = 10
const BULLET_AMOUNT : int = 180

@export var bullet_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	player_movement()
	
	pass

#func _unhandled_input(event: InputEvent) -> void:
	#if Input.is_action_pressed("shoot"):
		#var new_bullet = bullet_scene.instantiate()
		#new_bullet.position = position
		#get_parent().add_child(new_bullet)
		#print("shoot")

func player_movement() -> void:
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
	move_and_slide()


func _on_timer_timeout() -> void:
	if Global.bullet_count <= 10000:
		shot_full_circle()
	if Input.is_action_pressed("shoot"):
		shot_full_circle()

func shot_full_circle() -> void:
	var step = 2 * PI / BULLET_AMOUNT
	
	for i : int in range(BULLET_AMOUNT):
		var new_bullet = bullet_scene.instantiate()
		new_bullet.position = position + Vector2(radius, 0).rotated(step * i)
		new_bullet.rotation = Vector2(radius, 0).rotated(step * i).angle()
		print(new_bullet.rotation)
		#new_bullet.player_position = position
		
		#new_bullet.init_position = position + Vector2(0, i)
		
		get_parent().add_child(new_bullet)
