extends Resource

class_name Work

signal completed

## 工作名称
@export var alias : StringName
## 工作需要的技能
@export var skill : StringName
## 工作难度，即需要的技能熟练度
@export var difficult : int
## 工作能提升的最大熟练度
@export var max_practice : int
## 工作量
@export var workload : int
## 工作的产出
@export var output : Dictionary
## 工作述
@export var desc : String
