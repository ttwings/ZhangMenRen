extends Resource
# 属性类
class_name Race
# 当设置属性时
# signal on_set_attribute(id)
# 种类
export(String) var type
# 名称
export(String) var alias
# 体型
export(String) var body
# 速度
export(int) var speed
# 先手
export(int) var initiative
# 生命骰子
export(int) var Hp_dice = 0
# 灵力骰子
export(int) var Mp_dice = 0
# 神识骰子
export(int) var Ap_dice = 0
# 设置主属性，力量Str，资质Con，根骨Dex，悟性Int，威压Cha（魅力），感知Wis
export(int) var Str = 0
export(int) var Con = 0
export(int) var Dex = 0
export(int) var Int = 0
export(int) var Cha = 0
export(int) var Wis = 0
# 防御
export(int) var armor_class = 0
# 强韧
export(int) var fortitude = 0
# 反射
export(int) var reflex = 0
# 意志
export(int) var will = 0

# 遵守法律
export(int) var law = 0
# 性格善良
export(int) var good = 0
