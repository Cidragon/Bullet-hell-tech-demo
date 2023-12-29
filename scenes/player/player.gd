extends CharacterBody2D
class_name  Player

const speed : int = 400
const radius : int = 80
const BULLET_AMOUNT : int = 360

@export var bullet_scene : PackedScene
@onready var rotator: Node2D = %rotator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.player = self
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

var theta : float = 0.0
@export_range(0, 2*PI) var alpha : float = 0.0

func get_vector(angle : float) -> Vector2:
	theta = angle + alpha
	return Vector2(cos(theta), sin(theta))

func _on_timer_timeout() -> void:
	if Engine.get_frames_per_second() >= 100:
		shot_full_circle()
	if Input.is_action_pressed("shoot"):
		shot_full_circle()

func shot_full_circle(angle : int = 0) -> void:
	var step = 2 * PI / BULLET_AMOUNT
	
	for i : int in range(BULLET_AMOUNT):
		var bullet = Global.bullet_pool.pop_back()
		bullet.position = position + Vector2(radius, 0).rotated(step * i)
		bullet.direction = Vector2(cos(step * i), sin(step * i))
		get_tree().get_root().add_child(bullet)
