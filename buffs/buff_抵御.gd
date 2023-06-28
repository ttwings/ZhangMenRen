extends Buff

class_name buff_抵御

## 抵御
# 抵御是一种Buff，可以提高目标的抵抗力，减少受到的伤害
# 继承自Buff类

func load_info(id):
	# 加载抵御的基本属性
	name = "抵御"
	type = "Buff"
	desc = "提高目标的抵抗力，减少受到的伤害"
	# 抵御Buff的效果
	lv = 1
	life = 3
	life_val = 0
	# 影响属性

# 当添加buff时，会遍历target上的所有buff，同时查看buff运算库，获取buff交互效果
func on_add(target):
	# 添加抵御Buff时的效果



func on_remove(target):
	# 移除抵御Buff时的效果
	target.add_resist("physical", -0.1)
	target.add_resist("fire", -0.1)
	target.add_resist("ice", -0.1)
	target.add_resist("lightning", -0.1)
	target.add_resist("poison", -0.1)
	target.add_resist("dark", -0.1)

