extends Node2D

@export var bullet_scene : PackedScene

func _ready() -> void:
	start_bullet_pool(1000)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("bullet pool size: ", Global.bullet_pool.size())
	check_bullet_pool_size()
	pass

func start_bullet_pool(range : int) -> void:
	for i in range(range):
		var new_bullet = bullet_scene.instantiate()
		Global.bullet_pool.push_back(new_bullet)

func check_bullet_pool_size() -> void :
	if Global.bullet_pool.size() < Player.BULLET_AMOUNT:
		start_bullet_pool(Player.BULLET_AMOUNT)
