extends RigidBody3D

func launch(force):
	apply_central_impulse(force)
