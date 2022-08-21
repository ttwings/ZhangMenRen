extends Node2D


onready var icon = $Icon
onready var shadow = $Shadow
onready var hpbar = $Hpbar

var monster:Monster


func _init(m):
	monster = m
	
func update_hp_bar():
	if monster.hp/monster.max_hp == 0.9 :
		hpbar.frame = 1
		
func get_damage_state():
	var diff = 1		
