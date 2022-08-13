# 类名 防御
class_name  Defense

# 防御分为肉体物理防御hp_def、灵力魔法防御sp_def、神识精神防御ap_def
var hp_def = 0
var sp_def = 0
var ap_def = 0
# 防御不是伤害减免，而是和命中计算
# 效果防御
var effect_def = {}
# 添加一个效果防御
func add_effect_def(effect_name, value):
    effect_def[effect_name] = value
    return
# 删除一个效果防御
func del_effect_def(effect_name):
    if effect_name in effect_def:
        effect_def.erase(effect_name)
        return
    return
# 防御
func defend(attack:Attack):
    pass