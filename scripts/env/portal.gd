extends Area2D

@export var scene_path: String = ""

func on_body_entered(body) -> void:
	if body.is_in_group("mask_dude"):
		transition_screen.target_path = scene_path
		body.set_physics_process(false)
		body.sprite.action_behavior("dead")
