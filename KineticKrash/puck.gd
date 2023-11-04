extends RigidBody2D

# Speed limit to prevent the puck from moving too fast
const MAX_SPEED = 1000

func _physics_process(delta):
	limit_speed()

func limit_speed():
	if linear_velocity.length() > MAX_SPEED:
		linear_velocity = linear_velocity.normalized() * MAX_SPEED
