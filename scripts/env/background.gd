extends ParallaxBackground

@onready var parallax_layer: ParallaxLayer = get_node("ParallaxLayer")
@onready var background_layer: TextureRect = get_node("ParallaxLayer/BackgroundLayer")

var background_images_list: Array = [
	"res://assets/Background/Blue.png",
	"res://assets/Background/Brown.png",
	"res://assets/Background/Gray.png",
	"res://assets/Background/Green.png",
	"res://assets/Background/Pink.png",
	"res://assets/Background/Purple.png",
	"res://assets/Background/Yellow.png"
]

@export var direction: Vector2
@export var move_speed: float

func _ready() -> void:
	background_layer.texture = load(
		background_images_list[
			randi() % background_images_list.size()
		]
	)
	
	
func _physics_process(delta: float) -> void:
	parallax_layer.motion_offset += direction * delta * move_speed
