tool
# 演员类 用来控制场景中对象的显示
extends Node2D
class_name Actor

onready var tween = Tween.new()

var animation : Animation
# 以格子为单位进行移动
var cell = Vector2(0, 0)
# 目标格子
var target_cell = Vector2(0, 0)
# 当前移动方向
var direction = Vector2(0, 0)
# 每回合需要能量
const energy_per_turn = 100
# 当前肉体能量
var current_hp_energy = 0.0
# 当前灵力能量
var current_mp_energy = 0.0
# 当前神识能量
var current_ap_energy = 0.0

# 肉体回复速度
var hp_recover_speed = 1
# 灵力回复速度
var mp_recover_speed = 1
# 神识回复速度
var ap_recover_speed = 1

var action

func _ready():
	tween.name = "Tween"

func _process(delta):
	gain_energy()


# 积累能量
func gain_energy():
	current_hp_energy += hp_recover_speed
	current_mp_energy += mp_recover_speed
	current_ap_energy += ap_recover_speed
	pass
# 拥有足够 肉体 能量，用于移动、攻击、跳跃等肉体动作行为
func has_enougth_hp_energy():
	if current_hp_energy >= energy_per_turn:
		current_hp_energy -= energy_per_turn
		return true
	else:
		return false
	pass
# 拥有足够 灵力 能量，用于施法等灵力动作行为
func has_enougth_mp_energy():
	if current_mp_energy >= energy_per_turn:
		current_mp_energy -= energy_per_turn
		return true
	else:
		return false
	pass
# 拥有足够 神识 能量，用于冷静、思考、探索等神识动作行为
func has_enougth_ap_energy():
	if current_ap_energy >= energy_per_turn:
		current_ap_energy -= energy_per_turn
		return true
	else:
		return false
	pass

# 演员肉体动作回合
func take_hp_turn():
	print_debug("take hp turn")
	pass
# 演员灵力动作回合
func take_mp_turn():
	print_debug("take mp turn")
	pass
# 演员神识动作回合
func take_ap_turn():
	print_debug("take ap turn")
	pass

# 根据不同的回复情况，获得不同的回合情况
func take_turn():
	if has_enougth_hp_energy():
		take_hp_turn()
	elif has_enougth_mp_energy():
		take_mp_turn()
	elif has_enougth_ap_energy():
		take_ap_turn()
	else:
		gain_energy()
		pass

var current_action
var next_action

# 移动
func action_move(direction:Vector2):
	var default_action_point = 100
	var action_point = 100
	if current_hp_energy >= action_point:
		current_hp_energy -= action_point
		# move
		print("move")
		pass
	else:
		return false
