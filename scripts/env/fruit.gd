extends Area2D

@onready var sprite: Sprite2D = get_node("Texture")

var fruits_list: Array = [
	"res://assets/Items/Fruits/Apple.png",
	"res://assets/Items/Fruits/Bananas.png",
	"res://assets/Items/Fruits/Cherries.png",
	"res://assets/Items/Fruits/Kiwi.png",
	"res://assets/Items/Fruits/Melon.png",
	"res://assets/Items/Fruits/Orange.png",
	"res://assets/Items/Fruits/Pineapple.png",
	"res://assets/Items/Fruits/Strawberry.png"
]

var scores_list: Array = [
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8
]

var score: int = 0

@export var collected_effect: PackedScene = null

func _ready() -> void:
	randomize()
	var random_number: int = randi() % fruits_list.size()
	
	sprite.texture = load(
		fruits_list[random_number]
	)
	
	score = scores_list[random_number]
	
	
func on_body_entered(body) -> void:
	if body.is_in_group("mask_dude"):
		body.update_health(Vector2.ZERO, randi() % 3 + 1, "increase")
		body.update_score(score)
		spawn_effect()
		queue_free()
		
		
func spawn_effect() -> void:
	var effect = collected_effect.instantiate()
	effect.global_position = global_position
	get_tree().root.call_deferred("add_child", effect)
