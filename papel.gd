extends Area2D


# Declare member variables here. Examples:
# var a = 2
onready var guiapanel = $"../CanvasLayer/guia"
export(String, MULTILINE) var text = ''

var isJugador = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(isJugador && Input.is_action_just_pressed("mouse")):
		$"../soundMonkeyActive".play()
		guiapanel.visible = true
		guiapanel.get_node("RichTextLabel").text = text
		get_tree().paused = true
	if(isJugador && Input.is_action_just_pressed("ui_accept")):
		guiapanel.visible = false
		guiapanel.get_node("RichTextLabel").text = ''
		get_tree().paused = false
	pass


func _on_papel_body_entered(body):
	if(body.name == 'PlayerLight'):
		isJugador = true
		set_process(true)
	pass # Replace with function body.


func _on_papel_body_exited(body):
	if(body.name == 'PlayerLight'):
		isJugador = false
		set_process(false)
	pass # Replace with function body.
