extends Node2D

var projectile = preload("res://Scenes/projectile.tscn")

#@export var shots_per_second = PlayerManager.shots_per_second
@export var shots_per_second = PlayerManager.shots_per_second
var shot_timer: float = 0.0

func _physics_process(delta: float) -> void:
	
	if PlayerManager.can_shoot:
		shot_timer -= delta

		if shot_timer <= 0.0:
			shoot()
			shot_timer = 1.0 / shots_per_second

func shoot() -> void:
	var instance = projectile.instantiate()

	# Spawn the projectile at the wand
	get_tree().current_scene.add_child(instance)
	instance.global_position = global_position

	# Aim toward the mouse
	instance.direction = (get_global_mouse_position() - global_position).normalized()
	#instance.direction = (get_global_mouse_position()).normalized()
