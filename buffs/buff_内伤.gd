extends Buff

class_name buff_内伤

## 内伤
# 内伤是一种debuff，会在每次攻击前对自身造成伤害

func _data():
	name = "内伤"
	icon = preload("res://buffs/icons/buff_icon.png")
	description = "每次攻击造成伤害"
	duration = 5
	debuff = true
	resistible = true

func init():
	connect("on_apply",on_apply) 

## 效果函数
func on_apply(args):
	
	pass
