tool
# 演员类 用来控制场景中对象的显示
extends Node2D
class_name Actor

onready var tween = $Tween

var animation : Animation
# 以格子为单位进行移动
var cell = Vector2(0, 0)
# 目标格子
var target_cell = Vector2(0, 0)
# 当前移动方向
var direction = Vector2(0, 0)
# # 当前肉体行动能量，控制肌体的能量
# var current_hp_energy = 0.0
# # 当前灵力行动能量，控制体内灵力的能量
# var current_mp_energy = 0.0
# # 当前神识行动能量，控制调动大脑思考，神识外放的能量
# var current_ap_energy = 0.0

# 肉体能量回复速度，每回合回复的量
var hp_recover_speed = 1
# 灵力能量回复速度
var mp_recover_speed = 1
# 神识能量回复速度
var ap_recover_speed = 1

# 肉体动作、灵力动作、神识动作
var hp_action = null
var mp_action = null
var ap_action = null

# 伤害
func hurt(actor,attack_value,attack_type,source):
	if source == null:
		source = self
	var attack_info = AttackInfo.new()
	attack_info.attack_value = attack_value
	attack_info.attack_type = attack_type
	attack_info.source = source
	attack_info.target = actor
	attack_info.attack_actor = self
	return hurt_base(attack_info)

func hurt_base(attack_info):
	if attack_info.attack_target == null or attack_info.attack_target.is_death:
		return
	attack_info.attack_actor.emit_signal("on_cast_hurt_start", attack_info)
