@tool

extends Control
class_name TagV

@export var dbase : Tag


@onready var alias = %"Alias"
@onready var texture = %"Texture"
@onready var desc = %"Desc"
@onready var type = %"Type"
@onready var atts = %"Atts"
@onready var spe = %"Spe"
@onready var skill = %"Skill"
@onready var Req = %"Req"

func _ready():
	alias.text = dbase.alias
	alias.self_modulate = dbase.color
	texture.texture = dbase.texture
	desc.append_text(dbase.desc)
	
func _init(dbase:Tag=null):
	if dbase and dbase is Tag:
		alias.text = dbase.alias
		texture.texture = dbase.texture
		desc.append_text(dbase.desc)	

func _setup(dbase:Tag):
	alias.text = dbase.alias
	texture.texture = dbase.texture
	desc.append_text(dbase.desc)		
