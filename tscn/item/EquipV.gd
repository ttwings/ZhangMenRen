tool
extends Node2D

# 外观texture id
export(String) var apperence = ""
export(String,"weapon") var equip_type = ""
export(String,"hand_right") var slot = "hand_right"

onready var icon = $Icon
onready var doll = $Doll

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_icon():
	icon.texture = load("res://res/texture/item/" + equip_type + "/" + apperence +".png")
	return icon.texture
	pass

func get_doll():
	doll.texture = load("res://res/texture/player/" + slot + "/" + apperence + ".png")
	return doll
	pass
	
func _enter_tree():
	get_icon()
	get_doll()
	pass	
