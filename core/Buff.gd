extends Base
class_name Buff

var life = -1
var lifeVal = 0
var isDie = false 
# 是否是负面状态
var is_debuff = false
# 释放者
var caster:Actor = null
# 接受者
var target:Actor = null
# 图标名称
var icon_name:String = ""

func loadInfo(id):
	self.id = id
	icoId = "ico_%s" % id
	_data()
	for i in cons.attDs:
		if get(i) != null:
			attBase[i] = get(i)
	self.lv = lv
	_dataEnd()

func inStart(mas):
	masCha = mas
	castCha = mas
	.inStart(mas)
	self.lv = lv

var s = 0
func _process(delta):
	if life > 0 :
		lifeVal -= delta
		if lifeVal <= 0 :
			lifeVal = life
			setLv(lv - 1)
			if lv <= 0 :
				del()
	if s < 1 :
		s += delta
		if s >= 1 :
			_upS()

func _upS():
	pass

func getLvDec(lv):
	return dec
