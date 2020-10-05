extends Area2D

onready var player : KinematicBody2D = $"../PlayerLight"
onready var enemy : KinematicBody2D = $"../RealEnemy"

var isOn = false 

var bodyNames = {
	"player":'PlayerLight',
	"enemy": 'RealEnemy'
}

func _on_Interruptor_body_entered(body):
	if (body.name == bodyNames["player"]):
		player.onInterruptor = true
		player.InterruptorActual = self
	elif(body.name == bodyNames["enemy"]):
		enemy.SelectInrretupor()
		print("llego enemigo")
	pass # Replace with function body.


func _on_Interruptor_body_exited(body):
	if (body.name == bodyNames["player"]):
		player.onInterruptor = false
	pass # Replace with function body.
