extends CharacterBody3D

const SPEED = 6.0

const DEAD_ENEMY = preload("res://DeadEnemy.tscn")

var player

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):

	if player == null:
		return

	var direction = (player.global_position - global_position)
	direction.y = 0
	direction = direction.normalized()

	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED

	move_and_slide()

func die(force):

	var dead = DEAD_ENEMY.instantiate()

	get_parent().add_child(dead)

	dead.global_transform = global_transform

	dead.launch(force)

	queue_free()

	var spawner = get_tree().get_first_node_in_group("spawner")

	if spawner:
		spawner.spawn_enemy()
