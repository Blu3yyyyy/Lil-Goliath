extends CharacterBody2D


@export var speed = 250.0
@export var jump_velocity = -400.0
@onready var coyote_timer = $CoyoteTimer
@onready var jump_buffer = $JumpBufferTimer
@onready var dash = $DashTimer
@onready var dash_cooldown = $DashCooldown
@onready var flip_root: Node2D = $FlipRoot

const DASH_SPEED = 900
var dashing = false #changing variable
var can_dash = true
var facing := 1.0  # 1 = right, -1 = left

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and not dashing:
		velocity += get_gravity() * delta
		
	handle_jump()
	handle_dash()
	handle_movement()
	var was_on_floor = is_on_floor()
	move_and_slide()
	
	if was_on_floor and not is_on_floor() and velocity.y >=0:
		coyote_timer.start() #extra time to jump, after off surface


func handle_movement():
	var direction := Input.get_axis("move_left", "move_right")
	if direction > 0:
		flip_root.scale.x = 1  # Face Right
	elif direction < 0:
		flip_root.scale.x = -1 # Face Left (Flips all children nodes)
		
	if direction:
		facing = sign(direction)
	if dashing: #changes speed to dash speed when dashing
		velocity.x = facing * DASH_SPEED
	elif direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

func handle_jump() -> void:
	if Input.is_action_just_pressed("jump"): #jump input
		$JumpBufferTimer.start() #starts jump buffer after jumping
	
	if not jump_buffer.is_stopped() and (is_on_floor() or not coyote_timer.is_stopped()):
		velocity.y = jump_velocity # vertical velocity is the jump velocity
		jump_buffer.stop() # stops jump buffer timer if already pressed
		coyote_timer.stop()  # prevents double jump from coyote timer
		
#once hurtbox is configured, will add invulnerability to dash
func handle_dash():
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true #is dashing when pressed
		can_dash = false #prevents dashing in between a dash
		$DashTimer.start() #starts dashing time
		$DashCooldown.start() #cooldown for time

#when dash timer finishes, no more dashing
func _on_dash_timer_timeout() -> void:
	dashing = false 

#once cooldown finished, can dash again
func _on_dash_cooldown_timeout() -> void:
	can_dash = true 
