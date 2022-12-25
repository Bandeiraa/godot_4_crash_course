extends CanvasLayer

@onready var score: Label = get_node("Score")
@onready var health: Label = get_node("Health")

func _ready() -> void:
	score.text = 'Score: 0'
	
	
func update_health(value: int) -> void:
	health.text = str(value) + " Health" 
	
	
func update_score(new_score: int) -> void:
	score.text = 'Score: ' + str(new_score)
