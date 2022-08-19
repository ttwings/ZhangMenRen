extends Node2D

func _ready():
	Anima.begin(self)\
	.then(Anima.Node(self).anima_position_x(640,3))\
	.play()
