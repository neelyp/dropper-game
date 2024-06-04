extends RigidBody2D
@onready var ray_cast_2d = $RayCast2D
@onready var sprite = $Sprite2D;
var rng = RandomNumberGenerator.new()

#var start_position = Vector2.ZERO

signal coin_collected
signal hit_floor

# Called when the node enters the scene tree for the first time.
func _ready():
	var screen = get_viewport().get_visible_rect().size
	var x = rng.randf_range(sprite.scale.x, screen.x - sprite.scale.x)
	print(x)
	self.global_position.x = x
	

func _physics_process(delta):
	if ray_cast_2d.is_colliding():
		if ray_cast_2d.get_collider() == get_node("/root/Game/player"):
			#print("hit player")
			emit_signal("coin_collected")
			queue_free()
		if ray_cast_2d.get_collider() == get_node("/root/Game/floor"):
			#print("hit floor")
			emit_signal("hit_floor")
			queue_free()

