extends Area2D
class_name Bullet


const speed : int = 150
const max_timer : float = 10.0
var direction : Vector2
var timer : float = 0.0

func _enter_tree() -> void:
	request_ready()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.bullet_count += 1
	timer = 0.0

func _process(delta: float) -> void:
	position += direction * speed * delta
	timer += delta
	
	if timer >= max_timer:
		_on_timer_timeout()
	pass
	

func _on_timer_timeout() -> void:
	Global.bullet_count -= 1
	
	if Global.bullet_pool.size() < 5000:
		Global.bullet_pool.push_back(self)
		get_tree().get_root().remove_child(self)
	else:
		queue_free()

func die() -> void:
	Global.bullet_count -= 1
	
	queue_free()
