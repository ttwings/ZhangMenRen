extends Resource

class_name Item

## 名称
@export var alias := ""
## 描述
@export_multiline var desc : String
## 实体
@export var hp : int
@export var max_hp : int
## 灵气
@export var mp : int
@export var max_mp : int
## 神识
@export var ap : int
@export var max_ap : int


## 类别
@export var type : String
## 材质
@export var material : String
## 影响的属性id和value
@export var atts : Dictionary
## 特性
@export var spe : Dictionary
## 技能
@export var skill : Dictionary
## 需求
@export var req : Dictionary
## 物品等级
@export var lv : int
## 纹理
@export var texture : Texture
## 颜色
@export var color : Color
