extends Action

class_name AttackAction

var dir = Vector2(0, 0)
var speed = 3
var tile_size = 64

# 进攻方
var attacker
# 被攻方
var target

func _execute():
    attack(dir)

func attack(_dir):
	attack_tween(_dir)
		
func attack_tween(_dir):
    actor.tween.interpolate_property(actor, "position",
    actor.position, actor.position + _dir * tile_size,1.0/speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
    actor.tween.start()

# 攻防运算
func battle():
    if attacker is Race and target is Race:
        # 先计算是否命中
        # 再计算造成的伤害
        # 最后判断是否死亡
        # 处理最终结果
        # 调用动画显示
        # 调用窗口输出战斗结算信息 
        if _is_hit():
            _hurt()
        else:
            _miss()


func _is_hit():
    # 命中率
    # 命中率 = 攻击方攻击力 / 防御力
    attacker.attack
    pass

func _hurt():
    # 造成伤害
    # 造成伤害 = 攻击方攻击力 - 防御力
    pass    

func _miss():
    pass    