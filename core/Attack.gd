extends Resource

class_name Attack

# 攻击名称 劈砍、爪击、扫尾、啮咬、吞噬
export(String) var alias:String
# 最小伤害力
export(int) var min_damage:int
# 最大伤害力
export(int) var max_damage:int
# 暴击率
export(float) var critical_rate:float
# 暴击倍率
export(float) var critical_multiple:float
# 攻击类型 肉体：劈砍、穿刺、钝击 灵力：火、冰、雷、风、土 神识：阴、阳 
# 例如：slash、fire、thunder、wind、earth、water、light、dark
export(String) var attack_type:String
# 攻击范围
export(int) var attack_range:int
# 攻击距离
export(int) var attack_distance:int
# 攻击速度
export(int) var attack_speed:int
# 攻击动画
export(String) var attack_animation:String
# 攻击音效
export(String) var attack_sound:String

# 附带效果及难度等级，效果名称，效果id，难度DC等级，效果参数 比如：流血：{id:bleed,DC:10,level:1,parameter:10}
export(Dictionary) var effects = {}
# 肉体HP伤害效果有穿刺、流血、断筋、骨折、中毒、感染
enum HP_damage_effects{none, puncture, bleed, broken_bone, broken_joint, poison, infection}
# 灵力SP伤害效果有灼烧、冰冻、麻痹、枯竭、膨胀
enum SP_damage_effects{none, burn, freeze, paralize, depletion, inflation}
# 神识AP伤害效果有晕眩、恐惧、沉默、混乱
enum AP_damage_effects{none, daze, fear, silence, confusion}


func _init(alias = "", min_damage = 0, max_damage = 0, critical_rate = 0.05, critical_multiple = 2, attack_type = "", attack_range = 1, attack_distance = 1, attack_speed = 100, attack_animation = "", attack_sound = ""):
    self.alias = alias
    self.min_damage = min_damage
    self.max_damage = max_damage
    self.critical_rate = critical_rate
    self.critical_multiple = critical_multiple
    self.attack_type = attack_type
    self.attack_range = attack_range
    self.attack_distance = attack_distance
    self.attack_speed = attack_speed
    self.attack_animation = attack_animation
    self.attack_sound = attack_sound
    self.effects = {}