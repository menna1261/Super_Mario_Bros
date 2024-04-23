extends StaticBody2D
class_name Pipe

const TOP_PIPE_HIGHET = 16

@export var highet = 32
@export var is_traversable = false
@onready var pipe_body = $PipeBody
@onready var collision_shape_2d = $CollisionShape2D

func _ready():
	var region_rect = Rect2(pipe_body.region_rect)
	region_rect.size = Vector2(32 , highet - TOP_PIPE_HIGHET)
	pipe_body.region_rect = region_rect
	pipe_body.position = Vector2(0, highet/2)
	
	
	#adjusting the collisions 
	var shape = RectangleShape2D.new()
	shape.size = Vector2(32 , highet)
	collision_shape_2d.shape = shape
	collision_shape_2d.position = Vector2(0, highet/2 - TOP_PIPE_HIGHET / 2)
	


