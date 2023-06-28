extends Control

signal on_weather_changed
signal on_background_changed
signal on_enemy_changed
signal on_state_changed
signal on_action_pressed(id)
signal on_player_use_skill()

var weather:Weather

# 环境、敌人、玩家、群众、伙伴
var env = null
var enemys = []
var enemy = null
var player = null
var npcs = []
var partner = []

var is_player_running = false
var is_enemy_running = false


@onready var battlefield = get_node("VBoxContainer/Panel/SubViewportContainer/SubViewport/Battle3D")
@onready var action_bar = get_node("ActionPanel/HBoxContainer")
@onready var message = get_node("Message/RichTextLabel")

@onready var player_hp = $StatePlayer/VBoxContainer/BarHP
@onready var player_mp = $StatePlayer/VBoxContainer/BarMP
@onready var player_ap = $StatePlayer/VBoxContainer/BarAP

@onready var enemy_hp = $StateEnemy/VBoxContainer/BarHP
@onready var enemy_mp = $StateEnemy/VBoxContainer/BarHP
@onready var enemy_ap = $StateEnemy/VBoxContainer/BarHP

func _ready() -> void:
	player = battlefield.player
	battle_start()
	place_battler()
	show_battle_info()
	skill_start_cd()
	
var _time = 2	

func _process(delta):
	message.text = str("player position: %v",player.position)
	_time = _time - delta
	if _time < 0 :
		_time = 2
		enemy_skill_ready()
# 战斗开始

# 更新环境状态面板
# 更新玩家状态面板
# 更新玩家动作面板
# 更新敌人状态面板
# 更新敌人动作面板（不显示）
func battle_start():
	
	pass


func update_player_action_panel():
	player.target = enemy
	for a in player.actions :
		a.master = player
		a.target = enemy
		var action = ActionV.new()
		action.set_action(a)
		$ActionPanel.add_child(action)
	pass

# 敌我双方到达指定位置
func place_battler():
	pass

# 战场背景信息显示
func show_battle_info():
	pass

func skill_placed():
	pass

# 敌我双方，所有类型技能开始CD计时
func skill_start_cd():
	pass

# 点击准备好的技能，释放技能
func player_skill_ready():
	pass
	
func enemy_skill_ready():
	if is_player_running == false :
		battlefield.monster_attack()
		is_enemy_running = true
	pass	
# 所有该类别技能进入CD
func skill_start_reset():
	pass
	
# 释放能
func player_use_skill():
	pass	

func _on_action_v_on_do_action():
	battlefield.player_attack()
	pass # Replace with function body.

func _on_action_v_2_on_do_action():
	pass # Replace with function body.

## 添加家buff
## 添加npc的buff
## 添加环境buff
