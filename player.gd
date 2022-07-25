extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed: int = 100 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("moveRight"):
		velocity.x += 1.0
	if Input.is_action_pressed("moveLeft"):
		velocity.x -= 1.0
	if Input.is_action_pressed("moveUp"):
		velocity.y -= 1.0
	if Input.is_action_pressed("moveDown"):
		velocity.y += 1.0
	velocity = velocity.normalized()
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get('parameters/playback').travel("Idle")
	else:
		$AnimationTree.get('parameters/playback').travel("Walk")	
		$AnimationTree.set('parameters/Idle/blend_position', velocity)
		$AnimationTree.set('parameters/Walk/blend_position', velocity)
		move_and_slide(velocity * speed)
	
	
	
	
	
	
	
	
	
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
