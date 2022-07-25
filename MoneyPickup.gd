extends Area2D


var active = false
onready var moneypickup = get_node("/root/main/MoneyPickup")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_path())
	connect("body_entered", self, '_on_money_body_entered')
	connect("body_exited", self, '_on_money_body_exited')
	
	
func _process(delta):
	$QuestionMark.visible = active

func _input(event):
	if event.is_action_pressed("interact") and active:
		acquire()
		moneypickup.visible = !moneypickup.visible
		$CollisionShape2D.disabled = true
	
			
		
			
		
			
			
			
	
func _on_money_body_entered(body):
	if body.name == 'player' :
		active = true

func _on_money_body_exited(body):
	if body.name == 'player':
		active = false

func acquire():
	print("Hello")
	Global.money += 500
