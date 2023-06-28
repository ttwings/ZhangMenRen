extends Node

class_name Events

## 物品相关信号
## 显示、使用、装备、交易、丢弃 等
signal item_show
signal item_use
signal item_equip
signal item_trade
signal item_drop

## 人物相关信号
## 观察、交谈、移动、攻击、受伤、死亡 等
signal char_observe
signal char_talk
signal char_move
signal char_attack
signal char_hurt
signal char_die

## 房间相关信号
## 查看、进入、离开、切换、触发、装饰 等
signal room_look(room, char)
signal room_enter(room, char)
signal room_exit(room, char)
signal room_switch(room, char)
signal room_trigger(room, char)
signal room_decorate(room, char)



