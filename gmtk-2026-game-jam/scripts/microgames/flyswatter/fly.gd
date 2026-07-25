extends CharacterBody2D

var speed = 180;
var screen_size
var dir = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	move(delta)

func move(delta):
	velocity += dir * speed * delta
	rotation = velocity.angle() + 90
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	#Clamp in case physics breaks
	#position = position.clamp(Vector2(20, 20), (screen_size - Vector2(20, 20)))

func _on_timer_timeout():
	$Timer.wait_time = choose([0.1, 0.2, 0.3])
	dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])

func choose(array):
	array.shuffle()
	return array.front()
