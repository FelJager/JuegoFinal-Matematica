extends KinematicBody2D


const MASS = 5
const MAX_SPEED = 500
const ACCELERATION = 1800
const DECCELERATION = 2000

var speed: float = 0
var target_angle: float = 0

var target_motion := Vector2()
var motion := Vector2()
var steering := Vector2()
var direction := Vector2()

func _physics_process(delta) -> void:
	movel(delta)

func movel(delta) -> void:
	direction.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	direction.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))

if direction != Vector2():
	speed += ACCELERATION * delta
else
	speed -= DECCELERATION * delta

speed = clamp(speed, 0, MAX_SPEED)

target_motion = speed * direction.normalized() * delta

steering = target_motion - motion

if steering.lenght() > 1:
	steering = sterring.normalized()

motion += steering / MASS

if speed == 0
	motion = Vector2()

move_and_collide(motion)

if motion != Vector2():
	target_angle = atan2(motion.x, motion.y) + PI/2
	rotation = -target_angle




