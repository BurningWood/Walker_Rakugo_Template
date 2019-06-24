extends KinematicBody

const GRAVITY = -24.8
var vel = Vector3()
const MAX_SPEED = 20
const JUMP_SPEED = 18
const ACCEL = 4.5

var dir = Vector3()

const DEACCEL= 16
const MAX_SLOPE_ANGLE = 40

var camera
#var camera

var MOUSE_SENSITIVITY = 0.05

func _ready():
	camera = $Camera
#    camera = $camera/Camera
#    camera = $Rotation_Helper
#	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
    process_input(delta)
    process_movement(delta)

func process_input(delta):

    # ----------------------------------
    # Walking
    dir = Vector3()
    var cam_xform = camera.get_global_transform()

    var input_movement_vector = Vector2()

    if Input.is_action_pressed("F"):
        input_movement_vector.y += 1
    if Input.is_action_pressed("B"):
        input_movement_vector.y -= 1
    if Input.is_action_pressed("L"):
        input_movement_vector.x -= 1
    if Input.is_action_pressed("R"):
        input_movement_vector.x += 1

    input_movement_vector = input_movement_vector.normalized()

    dir += -cam_xform.basis.z.normalized() * input_movement_vector.y
    dir += cam_xform.basis.x.normalized() * input_movement_vector.x
    # ----------------------------------

    # ----------------------------------
    # Jumping
    if is_on_floor():
        if Input.is_action_just_pressed("movement_jump"):
            vel.y = JUMP_SPEED
    # ----------------------------------

    # ----------------------------------
    # Capturing/Freeing the cursor
    if Input.is_action_just_pressed("Mouse_move"):
        if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
            Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
        else:
            Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    # ----------------------------------

func process_movement(delta):
    dir.y = 0
    dir = dir.normalized()

    vel.y += delta * GRAVITY

    var hvel = vel
    hvel.y = 0

    var target = dir
    target *= MAX_SPEED

    var accel
    if dir.dot(hvel) > 0:
        accel = ACCEL
    else:
        accel = DEACCEL

    hvel = hvel.linear_interpolate(target, accel * delta)
    vel.x = hvel.x
    vel.z = hvel.z
    vel = move_and_slide(vel, Vector3(0, 1, 0), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE))

func _input(event):
    if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
        camera.rotate_x(deg2rad(-event.relative.y * MOUSE_SENSITIVITY))
        self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))

        var camera_rot = camera.rotation_degrees
        camera_rot.x = clamp(camera_rot.x, -70, 70)
        camera.rotation_degrees = camera_rot

func _on_Area_body_entered(body):
	Rakugo.say({0:"Yay"})
