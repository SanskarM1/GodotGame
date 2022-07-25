extends Area2D


var active = false
var dialog = null


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_path())
	connect("body_entered", self, '_on_NPC_body_entered')
	connect("body_exited", self, '_on_NPC_body_exited')
	
func _process(delta):
	$QuestionMark.visible = active

func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("interact") and active:
			get_tree().paused = true
			dialog = Dialogic.start('timeline-1')
			
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect("timeline_end", self, "unpause")
			add_child(dialog)
			
			

func unpause(timeline_name):
	get_tree().paused = false
			
	
func _on_NPC_body_entered(body):
	if body.name == 'player' :
		active = true

func _on_NPC_body_exited(body):
	if body.name == 'player':
		active = false

func get_money():
	print("Hello")
	Dialogic.set_variable("Money", Global.money)

func set_money():
	Global.money -= 500

