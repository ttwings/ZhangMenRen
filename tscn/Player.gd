extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Resource) var hero

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _init(hero):
	self.hero = hero

func _unhandled_input(event):
	# 英雄控制组件里面
	hero.controller.take_turn(event)



