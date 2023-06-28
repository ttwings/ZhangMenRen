extends Resource

class_name 修士

## 基础属性 姓名、性别、年龄、寿元、种族、最适温度、极限温度、参悟点、道行、情绪
## 姓名
@export var alias : StringName
## 性别
@export var gender : StringName
## 年龄
@export var age : int
## 寿元
@export var max_age : int
## 种族
@export var race : StringName
## 最适温度
@export var temp_opt : Array[int]
## 极限温度
@export var temp_limit : Array[int]
## 参悟点
@export var insight : int
## 道行
@export var cultivation : int
## 情绪
@export var emotion : int
## 修行状况
@export var practice : Practice
## 健康状况
@export var health : Health
## 灵根
@export var root : Root
## 生活技能
@export var skill : Skill
## 战斗属性
@export var battle : Battle
## 道具装备
@export var equip : Equip
## 画符
@export var draw : Draw
## 炼宝
@export var refine : Refine
## 炼丹
@export var alchemy : Alchemy
## 炼器
@export var forge : Forge
