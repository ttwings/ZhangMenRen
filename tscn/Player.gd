extends Node2D

export(Resource) var hero

onready var animation = get_node("AnimationPlayer")
onready var hp_bar = get_node("%HpBar") 
var mp_bar
var ap_bar
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _init(hero):
#	._init(hero)
	self.hero = hero
	self.hero.connect("on_cell_change",self,"r_cell_change")
	self.hero.connect("on_hurt",self,"r_hurt")
	self.hero.connect("on_plus",self,"r_plus")
	self.hero.connect("on_plus_lv",self,"r_plus_lv")
	self.hero.connect("on_play_animation",self,"r_play_animation")
	# 肉体、灵力、神识初始化
	hp_bar.init(hero)
	mp_bar.init(hero)
	ap_bar.init(hero)
	# 动画显示初始化
	animation.init(hero)
	# 添加提示功能
	Sys.add_tip()
	# 装备添加按键
	for i in self.hero.fighter.equips:
		var button = preload("res://tscn/item/EquipButton.tscn").instance()
		equips.add_child(button)
		button.init(i)

func _unhandled_input(event):
	# 英雄控制组件里面
	pass

func r_cell_change():
	# animation to move
	pass
	
func r_hurt():
	animation.play("hurt")	

