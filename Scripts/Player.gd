extends CharacterBody2D

@export var speed = 0.0
@export var desired_speed = PlayerManager.move_speed
@export var acceleration = 5000.0
@export var deceleration = 3800.0
@export var dash_speed = PlayerManager.dash_speed

@onready var dash_cooldown = $Dash_Cooldown
var can_dash = true

#var projectile = preload("res://Scenes/projectile.tscn")


func _ready() -> void:
	dash_cooldown.timeout.connect(_on_dash_cooldown_timeout)
	#var projectile = projectile.instantiate()
	#get_tree().current_scene.add_child(projectile)

func get_move_input(delta: float) -> void:
	var input_direction = Input.get_vector("left", "right", "up", "down")

	if input_direction != Vector2.ZERO:
		# Accelerate in the direction of the input
		velocity = velocity.move_toward(
		input_direction * desired_speed,
		acceleration * delta
		)
	else:
		# Apply friction when there is no input
		velocity = velocity.move_toward(
		Vector2.ZERO,
		deceleration * delta
		)

	# Update speed for debugging
	speed = velocity.length()

func Dash():
	if PlayerManager.can_dash:
		var input_direction = Input.get_vector("left", "right", "up", "down")
	
		if not can_dash:
		#print("no dash")
			return
		
	
		if input_direction == Vector2.ZERO:
		#print("no dash because didint move")
			return 

		velocity = input_direction * dash_speed
		can_dash = false
		dash_cooldown.start()
	#print("COOLDOWN BEGIN")
	
	#print("dashed")

#func shoot():
	
	
	
func _on_dash_cooldown_timeout():
	print("COOLDOWN FINISHED")
	
	can_dash = true
	
	print(can_dash)
func _physics_process(delta: float) -> void:
	get_move_input(delta)
	move_and_slide()
	if Input.is_action_just_pressed("dash"):
		Dash()
		
	#print("SPEED: " + str(speed))
	#print("DESIRED_SPEED: " + str(desired_speed))
	#print("ACCELERATION: " + str(acceleration))
	#print("DECELERATION: " + str(deceleration))
