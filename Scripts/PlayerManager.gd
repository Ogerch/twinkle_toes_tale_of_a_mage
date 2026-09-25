extends Node

@export_category("Movement")
@export var move_speed: float = 600.0
@export var dash_speed: float = 2000.0
#@export var dash_duration: float = 0

@export_category("Combat")
#@export var damage: int = 10
@export var shots_per_second: float = 1.0
@export var projectile_speed: float = 800

@export_category("Health")
@export var max_health: int = 100

@export_category("Abilities")
@export var can_dash: bool = true
@export var can_shoot: bool = true
