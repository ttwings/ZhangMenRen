extends Item

## 照妖镜
# 照妖镜是一种饰品，可以照出妖怪的原型，并造成光线伤害，混乱效果
# 继承自Item类

@export var id: int = 1001
@export var icon: String = "res://assets/icons/items/1001.png"
@export var model: String = "res://assets/models/items/1001.tscn"
@export var price: int = 100
@export var level: int = 1
@export var quality: int = 1
@export var max_stack: int = 1
@export var max_durability: int = 100
@export var category: String = "饰品"
@export var sub_category: String = "饰品"
@export var equip_type: String = "饰品"
@export var type: String = "饰品"
@export var name: String = "照妖镜"
@export var desc: String = "可以照出妖怪的原型，并造成光线伤害，混乱效果"
@export var weight: int = 5
@export var material_level: int = 3
@export var durability: int = 100

func use():
	# 使用照妖镜时的效果
	var target = get_node("/root/Game/Player/Target")
	if target != null and target.is_monster():
		target.take_damage(50, "light")
		target.add_buff("confusion", 5)
