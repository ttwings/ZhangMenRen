extends Buff

# 流血debuff类
class_name b_liu_xue

# 设置debuff的一些基本属性
func _data():
	alias = "流血" # 别名
	is_die = true # 是否可叠加
	life = 3 # 持续时间

# 在debuff生效时添加一个名为“eff_流血”的特效，并将其绑定到目标角色上
func _in():
	if is_instance_of(mas.vis) :
		var eff = data.new_res("eff_流血").instance()
		mas.vis.add_child(eff)
		eff.transform.origin = mas.transform.origin
		eff.init(self)
		mas_cha.connect("on_hurt",r)
		
# 计算角色受到的额外伤害，并调用角色的hurt()函数进行伤害结算
func r(atk:Attack):
	if attack.hurt_type != HURTTYPE.EFF :
		cast_cha.hurt(mas_cha,attack.atk_val * 0.2 * lv, HURTTYPE.EFF, self)
