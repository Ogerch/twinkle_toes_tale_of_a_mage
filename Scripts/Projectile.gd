extends Node2D

@export var speed: float = PlayerManager.projectile_speed
var direction: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta
