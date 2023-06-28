extends Resource
class_name Tag

## 名称
@export var alias := ""
## 影响的状态名
@export var target := ""
## 影响的属性名
@export_enum("最大","当前","变化") var key
## 影响值
@export var value := 0.0
## 是否自动消失
@export var disappear := false
## 自动消失的时间
@export var life := 1
## 影响的属性id和value
@export var atts : Dictionary
## 纹理
@export var texture : Texture
## 描述
@export_multiline var desc : String
## 颜色
@export_color_no_alpha var color : Color
