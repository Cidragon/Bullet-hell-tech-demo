extends CharacterBody2D

const speed : int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.bullet_count += 1
	velocity = Vector2(1, 0).rotated(rotation) * speed
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()
	#position.x += delta * speed
	pass
	

func _on_timer_timeout() -> void:
	Global.bullet_count -= 1
	queue_free()
