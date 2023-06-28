extends Resource

class_name Special

## 名称
@export var alias : StringName
## 描述
@export var desc : String
## 等级
@export var lv : int
## 影响增减的属性
@export var add_atts : Dictionary

## 获取add_atts
func get_add_atts_by_lv():
	var _atts
	for a in add_atts:
		_atts[a] = add_atts[a] * lv
	return _atts
