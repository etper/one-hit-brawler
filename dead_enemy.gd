extends RigidBody3D

func launch(force):

	sleeping = false

	linear_velocity = force

	angular_velocity = Vector3(
		randf_range(-12.0, 12.0),
		randf_range(-12.0, 12.0),
		randf_range(-12.0, 12.0)
	)
