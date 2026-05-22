extends Node3D

const ENEMY = preload("res://enemy.tscn")

@export var spawn_radius = 20.0
@export var enemy_count = 12

func _ready():

	for i in enemy_count:
		spawn_enemy()

func spawn_enemy():

	var enemy = ENEMY.instantiate()

	get_parent().add_child(enemy)

	var angle = randf() * TAU
	var radius = randf_range(5.0, spawn_radius)

	enemy.global_position = Vector3(
		cos(angle) * radius,
		1.0,
		sin(angle) * radius
	)
