extends Resource

class_name Condition
## 别名
@export var alias: String
## 最大值，最小值默认0
@export var max: float
## 当前值
@export var current: float
## 变化值
@export var change: float
## 标签表
@export var tags: Array[Tag]

## 设置最大值
func set_max(value: float):
	self.max = value
	self.current = clamp(self.current, 0, self.max)

## 设置当前值
func set_current(value: float):
	self.current = clamp(value, 0, self.max)

## 设置变化值
func set_change(value: float):
	self.change = value

## 设置标签数组
func set_tags(value: Array):
	self.tags = value

## 更新状态
func update(delta: float):
	# 应用标签数组
	for tag in self.tags:
		var tag_name = tag.alias
		var tag_key = tag.key
		var tag_value = tag.value
		if tag_key == "max":
			self.max += tag_value
		elif tag_key == "current":
			self.current += tag_value
		elif tag_key == "change":
			self.change += tag_value

	# 更新当前值
	self.current += self.change * delta
	self.current = clamp(self.current, 0, self.max)

## 查询属性值
func query(property_name: String) -> float:
	var value = self.get(property_name)
	for tag in self.tags:
		if tag.alias == property_name:
			value += tag.value
	return value
