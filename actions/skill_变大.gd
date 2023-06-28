extends Skill

## 让形体变大的技能
## 会增加肉体强度
## 会增加碰撞体积

## 变大倍数 1.0 为原始大小

var scale = 1.0

func _data():
	alias = "变大术"
	dec = "肉身变大, 肉体强度增加"
	
func _ups():
	hp_max_ret = 2	
