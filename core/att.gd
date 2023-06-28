extends Node
# 战斗属性类
class_name Att

signal on_att_set(id)

## 当前生命值
@export var hp:	# 当前生命值
	set(v):
		if owner is Base:
			owner.dbase["hp"] = v
		else:
			error_string("no base owner",owner)
		emit_signal("on_changed","hp")
	get:
		return owner.dbase["hp"]

## 最大生命值				
@export var max_hp:
	set(v):
		dbase["max_hp"] = v
		emit_signal("on_changed","max_hp")
	get:
		return dbase["max_hp"]

## 当前灵气值
@export var mp:
	set(v):
		dbase["mp"] = v
		emit_signal("on_changed","mp")
	get:
		return dbase["mp"]

## 最大灵气值
@export var max_mp:
	set(v):
		dbase["max_mp"] = v
		emit_signal("on_changed","max_mp")
	get:
		return dbase["max_mp"]

## 当前神识值
@export var ap:
	set(v):
		dbase["ap"] = v
		emit_signal("on_changed","ap")
	get:
		return dbase["ap"]

## 最大神识值
@export var max_ap:
	set(v):
		dbase["max_ap"] = v
		emit_signal("on_changed","max_ap")
	get:
		return dbase["max_ap"]

## 物理攻击
@export var h_atk:
	set(v):
		dbase["h_atk"] = v
		emit_signal("on_changed","h_atk")
	get:
		return dbase["h_atk"]

## 物理防御
@export var h_def:
	set(v):
		dbase["h_def"] = v
		emit_signal("on_changed","h_def")
	get:
		return dbase["h_def"]

## 物理豁免
@export var h_dod:
	set(v):
		dbase["h_dod"] = v
		emit_signal("on_changed","h_dod")
	get:
		return dbase["h_dod"]

## 法术攻击
@export var m_atk:
	set(v):
		dbase["m_atk"] = v
		emit_signal("on_changed","m_atk")
	get:
		return dbase["m_atk"]

## 法术防御
@export var m_def:
	set(v):
		dbase["m_def"] = v
		emit_signal("on_changed","m_def")
	get:
		return dbase["m_def"]

## 法术豁免
@export var m_dod:
	set(v):
		dbase["m_dod"] = v
		emit_signal("on_changed","m_dod")
	get:
		return dbase["m_dod"]

## 精神攻击
@export var a_atk:
	set(v):
		dbase["a_atk"] = v
		emit_signal("on_changed","a_atk")
	get:
		return dbase["a_atk"]

## 精神防御
@export var a_def:
	set(v):
		dbase["a_def"] = v
		emit_signal("on_changed","a_def")
	get:
		return dbase["a_def"]

## 精神豁免
@export var a_dod:
	set(v):
		dbase["a_dod"] = v
		emit_signal("on_changed","a_dod")
	get:
		return dbase["a_dod"]

## 护盾值
@export var shield_value:
	set(v):
		dbase["shield_value"] = v
		emit_signal("on_changed","shield_value")
	get:
		return dbase["shield_value"]

## 护盾强度
@export var shield_rate:
	set(v):
		dbase["shield_rate"] = v
		emit_signal("on_changed","shield_rate")
	get:
		return dbase["shield_rate"]


@export var att_base:Dictionary = {}
# 百分比相加属性
var per_add_ds = {}
# 百分比相乘属性
var per_mul_ds = {}
# 相加性
var atts = []

var att_diabled = false
## 层级
var lv = 1 :
	set(v):
		lv = v
		emit_signal("on_lv_set")
	get:
		return lv

func load_info(id):
	self.id = id
	_data()
	for i in info:
		if get(i) != null:
			att_base[i] = get(i)
	self.lv = lv
	_data_end()	

func _f_att(id,v):
	emit_signal("on_att_set",id)	

# 叠加
func per_add(id,v):
	per_add_ds[id] = v
	_f_att(id, v)			

# 相乘
func per_mul(id,v):
	per_mul_ds[id] = v
	_f_att(id, v)

# 是否有目标id 附加物
func has_append(id):
	for i in appends:
		if i.id == id :
			return i
	return null

## 更新属性
## 根据传入的att对象，更新属性
## 参数：att - Att对象
## 返回值：无
func update_att(att):
	for i in att.att_base :
		if att.get(i) == null : continue
		if att.get(i) != 0 or att.per_add_ds.has(i) or att.per_mul_ds.has(i) :
			run_att_set(i)


## 运行属性设置
## 根据属性id，计算属性值，并设置到对应的属性上
## 参数：id - 属性id
## 返回值：无

func run_att_set(id):
	@export var val = att_base[id]
	@export var per = 1.0
	@export var mul = 1.0
	for i in atts:
		if i.att_disabled : continue
		if i.get(id) == null : continue
		val += i[id]
		if i.per_add_ds.has(id):
			per += i.per_add_ds[id]
		if i.per_mul_ds.has(id):
			mul *= 1 + i.per_mul_ds[id]
	set(id,val * per * mul)
			
		
							
