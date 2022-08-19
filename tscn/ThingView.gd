extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var icon = $Icon
onready var tip = $Tip
var thing

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init(_thing):
	thing = _thing
