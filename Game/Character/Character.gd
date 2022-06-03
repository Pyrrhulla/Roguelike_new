extends KinematicBody2D
class_name Character, "res://Assets/0x72_DungeonTilesetII_v1.3.1 2/frames/masked_orc_idle_anim_f0.png"

const FRICTION: float = 0.15



export(int) var acceleration: int = 40
export(int) var max_speed: int = 100

onready var state_machine: Node = get_node("FiniteStateMachine")
onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")

var mov_direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	velocity = move_and_slide(velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)
  
func move() -> void:
	mov_direction = mov_direction.normalized()
	velocity += mov_direction * acceleration
	velocity = velocity.clamped(max_speed)
	

