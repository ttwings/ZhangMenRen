extends Control

@export var item : Item
@onready var alias = %"Alias"
@onready var texture = %"Texture"
@onready var desc = %"Desc"
@onready var type = %"Type"
@onready var atts = %"Atts"
@onready var spe = %"Spe"
@onready var skill = %"Skill"
@onready var Req = %"Req"
@onready var lv = %"Lv"


func _ready():
	alias.text = item.alias
	alias.self_modulate = item.color
	texture.texture = item.texture
	desc.append_text(item.desc)
	type.text = item.type
	_read_atts(item.atts)
	_read_spe(item.spe)
	_read_skill(item.skill)
	_read_req(item.req)
	
func _read_atts(_atts:Dictionary):
	var t:String
	for att in _atts:
#		t = t + att + ":" + _atts[att] + "\n"
		t = t + _atts[att] + "  : " + att + "\n" 
	atts.add_text(t)	
	pass
	
func _read_spe(spe:Dictionary):
	pass
	
func _read_skill(skill:Dictionary):
	pass
	
func _read_req(req:Dictionary):
	pass

func _read_lv(_lv:int):
	pass
