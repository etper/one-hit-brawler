extends CharacterBody3D

const SPEED = 14.0
const JUMP_VELOCITY = 7.0
const MOUSE_SENS = 0.002

const DASH_FORCE = 35.0
const DASH_TIME = 0.12
const DASH_COOLDOWN = 0.25

const PUNCH_FORCE = 155.0

const SHAKE_STRENGTH = 0.15

var shake_time = 0.0

var dash_timer = 0.0
var dash_cooldown_timer = 0.0
var dash_direction = Vector3.ZERO

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var camera = $Camera3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * MOUSE_SENS)
		camera.rotate_x(-event.relative.y * MOUSE_SENS)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-89), deg_to_rad(89))

func _physics_process(delta):

	if shake_time > 0.0:

		shake_time -= delta

		camera.position = Vector3(
			randf_range(-SHAKE_STRENGTH, SHAKE_STRENGTH),
			randf_range(-SHAKE_STRENGTH, SHAKE_STRENGTH),
			0
		)

	else:

		camera.position = Vector3.ZERO

	if Input.is_action_just_pressed("attack"):
		punch()

	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	# DASH INPUT
	if Input.is_action_just_pressed("shift") and dash_cooldown_timer <= 0.0:

		if direction == Vector3.ZERO:
			direction = -transform.basis.z

		dash_direction = direction.normalized()

		dash_timer = DASH_TIME
		dash_cooldown_timer = DASH_COOLDOWN

	# DASH ACTIVE
	if dash_timer > 0.0:

		dash_timer -= delta

		velocity.x = dash_direction.x * DASH_FORCE
		velocity.z = dash_direction.z * DASH_FORCE

	else:

		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

	if dash_cooldown_timer > 0.0:
		dash_cooldown_timer -= delta

	move_and_slide()

func punch():

	var bodies = $PunchArea.get_overlapping_bodies()

	for body in bodies:

		if body.has_method("die"):

			var dir = (
				body.global_position - global_position
			).normalized()

			dir.y = 0.35
			dir = dir.normalized()

			body.die(dir * PUNCH_FORCE)

			hitstop(0.1, 0.2)
			
			shake_time = 0.12

func hitstop(time_scale: float, duration: float):

	Engine.time_scale = time_scale

	await get_tree().create_timer(duration * time_scale).timeout

	Engine.time_scale = 1.0
