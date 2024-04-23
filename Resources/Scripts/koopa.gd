extends Enemy
class_name Koopa
var in_a_shell = false
@export var slide_speed = 200
const KOOPA_SHELL_COLLISION_SHAPE_POSITION=  Vector2(0 , 5)
#const KOOPA_SHELL = preload("res://Resources/Assets/Sprites/Koopa_Shell.png")
const KOOPA_SHELL_COLLISION_SHAPE = preload("res://Resources/Resources_/collision_Shapes/koopa_shell_collision_shape.tres")
const KOOPA_FULL_COLLSION_SHAPE = preload("res://Resources/Resources_/collision_Shapes/koopa_full_collsion_shape.tres")
@onready var collision_shape_2d = $CollisionShape2D

func _ready():
	collision_shape_2d.shape = KOOPA_FULL_COLLSION_SHAPE
	
	
func die():
	if !in_a_shell:
		super.die()
	collision_shape_2d.set_deferred("shape", KOOPA_SHELL_COLLISION_SHAPE)
	collision_shape_2d.set_deferred("position" , KOOPA_SHELL_COLLISION_SHAPE_POSITION)
	in_a_shell =  true
	
	
func on_stomp(player_position : Vector2):
	set_collision_mask_value(1, false)
	set_collision_layer_value(3, false)
	set_collision_layer_value(4, true)
	
	var movement_direction = 1 if player_position.x <= global_position.x else -1
	horizontal_speed = -movement_direction * slide_speed

