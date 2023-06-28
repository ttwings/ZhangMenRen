extends Att

class_name Buff

## 当删除时触发
signal on_del
## 当设置释放者时触发
signal on_set_cast(char)
## 当设置接受者时触发
signal on_set_mast(char)
# 设置层数
signal on_set_lv()
		
var life = -1
var life_val = 0
var is_del = false
# 释放者
var cast_cha:Chara = null
# 持有者
var mast_cha:Chara = null

var att:Att = null
var eff:Node2D = null
var eff_id = ""
var is_negetive = false
var direc = ""

var time

func _init() -> void:
	init()
	var ss = get_script().resource_path
	var fname = ss.split("/")
	id = fname[fname.size()-1].split(".")[0]
	direc = ss.left(ss.length() - id.length()-3)

func init():
	pass
	
func att_init():
	att = Att.new()	

func _connect():
	pass

func del_connect():
	pass
	
func _get_info():
	return info
	
func process(delta):
	pass
	
func _process(delta):
	if life > 0 :
		life_val -= delta
		if life_val <= 0 :
			life_val = life
			lv = lv - 1
			if lv <= 0 :
				del()	
	pass	
	
func _update_att():
	pass
	
func del():
	if eff != null : eff.queue_free()
	del_connect()
	_del()
	emit_signal("on_del")
		
func _del():
	pass		
			
	

