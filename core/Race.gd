extends Node
# 种族Node
class_name Race
# 当设置属性时
# signal on_set_attribute(id)
# 种类
@export var type: String
# 名称
@export var alias: String
# 体型
@export_enum("巨型","大型","中型","小型","微型") var body: int
# 速度
@export var speed: int
# 先手
@export var initiative: int
# 生命骰子
@export var Hp_dice: int = 0
# 灵力骰子
@export var Mp_dice: int = 0
# 神识骰子
@export var Ap_dice: int = 0

# 设置主属性，资质Con，根骨Dex，悟性Int
@export var Con: int = 0
@export var Dex: int = 0
@export var Int: int = 0

## 防御 护体强度
@export var armor_class: int = 0
# 防御 护体率
@export var armor_rate: int = 0

# 肉体 强韧 肉体豁免
@export var fortitude: int = 0
# 条件 反射 灵法豁免
@export var reflex: int = 0
# 神识 意志 神识豁免
@export var will: int = 0

# 遵守法律
@export_range(-100,100) var law: int = 0

# 性格善良
@export_range(-100,100) var good: int = 0

# 当进入节点时设置自己的组为race
func _ready():
	if owner is Base :
		owner.add_append("race",self)
		owner.set("race/type",type)
		owner.set("race/alias",alias)
	pass
