extends Node2D

@onready var player: CharacterBody2D = get_node("MaskDude")
@onready var interface: CanvasLayer = get_node("Interface")

@export var scene_path: String = ""

func _ready() -> void:
	interface.update_health(player.max_health)
	
	transition_screen.target_path = scene_path
	transition_screen.connect(
		"start_level", Callable(self, "start_level")
	)
	
	if transition_screen.current_score != 0:
		player.total_score = transition_screen.current_score
		interface.update_score(transition_screen.current_score)
		
	if transition_screen.current_health != 0:
		player.health = transition_screen.current_health
		interface.update_health(transition_screen.current_health)
		
		
func start_level() -> void:
	print("Aqui você pode iniciar o seu nível chamando alguma coisa, como uma cinemática")
