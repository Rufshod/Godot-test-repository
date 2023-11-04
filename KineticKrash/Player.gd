extends CharacterBody2D



const MAX_SPEED = 2000
const ACCELERATION = 0.9  # This value is between 0 and 1. Tweak it to get the desired acceleration feel.
const DECELERATION = 8
const STOP_THRESHOLD = 5.0  # When velocity is below this value, set it to zero to prevent oscillation

var axis = Vector2.ZERO

func _physics_process(delta):
	handle_input()
	move(delta)

func handle_input():
	# Using Input.get_vector() to get the directional vector.
	axis = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	axis = axis.normalized()

func move(delta):
	if axis == Vector2.ZERO:
		apply_friction(delta)
	else: 
		apply_movement(axis, delta)
		
	move_and_slide()

func apply_friction(delta):
	if axis == Vector2.ZERO:
		velocity = velocity.lerp(Vector2.ZERO, DECELERATION * delta)
		# Prevent tiny oscillations by setting velocity to zero when it's very small
		if velocity.length() < STOP_THRESHOLD:
			velocity = Vector2.ZERO

func apply_movement(direction, delta):
	var target_velocity = direction * MAX_SPEED
	velocity = velocity.lerp(target_velocity, ACCELERATION * delta)
