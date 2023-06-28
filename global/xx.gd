class_name XX
## 修仙方面格式转换

####################  品阶 与 色彩方面  ####################

const GRADE_MAP = {
	0: "无阶",
	1: "一阶下品",
	2: "一阶中品", 
	3: "一阶上品",
	4: "一阶极品",
	5: "二阶下品",
	6: "二阶中品",
	7: "二阶上品",
	8: "二阶极品",
	9: "三阶下品",
	10: "三阶中品",
	11: "三阶上品",
	12: "三阶极品",
	13: "四阶下品",
	14: "四阶中品",
	15: "四阶上品",
	16: "四阶极品",
	17: "五阶下品",
	18: "五阶中品",
	19: "五阶上品",
	20: "五阶极品",
	21: "六阶下品",
	22: "六阶中品",
	23: "六阶上品",
	24: "六阶极品",
	25: "七阶下品",
	26: "七阶中品",
	27: "七阶上品",
	28: "七阶极品",
	29: "八阶下品",
	30: "八阶中品",
	31: "八阶上品",
	32: "八阶极品",
	33: "九阶下品",
	34: "九阶中品",
	35: "九阶上品",
	36: "九阶极品"
}

static func get_grade(level):
	if level < 0:
		return GRADE_MAP[0]  # 无阶
	if level > 9:
		return GRADE_MAP[9]  # 三阶下品
	return GRADE_MAP[level] 

## 设定品阶对应的颜色，无阶：灰色，一阶白色，二阶绿色，三阶蓝色，四阶紫色，五阶橙色，六阶红色，七阶金色，八阶黑色，九阶彩色
const GRADE_COLOR_CODE_MAP = {
	0: "#999999",
	1: "#FFFFFF",
	2: "#00FF00",
	3: "#0000FF",
	4: "#FF00FF",
	5: "#FFA500",
	6: "#FF0000",
	7: "#FFD700",
	8: "#000000",
	9: "#FF00FF"
}
## 获取品阶对应的颜色code
static func get_grade_color_code(level):
	if level < 0:
		return GRADE_COLOR_CODE_MAP[0]  # 无阶
	if level > 9:
		return GRADE_COLOR_CODE_MAP[9]  # 三阶下品
	return GRADE_COLOR_CODE_MAP[level]

## 设定颜色为Color类型
const GRADE_COLOR_MAP = {
	0: Color(0.6, 0.6, 0.6),
	1: Color(1, 1, 1),
	2: Color(0, 1, 0),
	3: Color(0, 0, 1),
	4: Color(1, 0, 1),
	5: Color(1, 0.65, 0),
	6: Color(1, 0, 0),
	7: Color(1, 0.84, 0),
	8: Color(0, 0, 0),
	9: Color(1, 0, 1)
}
## 获取品阶对应的颜色
static func get_grade_color(level):
	if level < 0:
		return GRADE_COLOR_MAP[0]  # 无阶
	if level > 9:
		return GRADE_COLOR_MAP[9]  # 三阶下品
	return GRADE_COLOR_MAP[level]

## 将文本和颜色转换为bbcode格式
static func string_color(str:String,color:Color):
	return "[color=#" + color.to_html() + "]" + str + "[/color]"

## 设定函数，输入等级，输出对应的称号；等级划分为 凡人、炼气、筑基、金丹、元婴，化神、炼虚、合体、大乘、渡劫；其中凡人为0级，炼气为1-9级，筑基为10-19级，金丹为20-29级，元婴为30-39级，化神为40-49级，炼虚为50-59级，合体为60-69级，大乘为70-79级，渡劫为80-89级，每级又分为初期、中期、后期、大后期、圆满。
const LEVEL_MAP = {
	0: "凡人",
	1: "炼气",
	2: "筑基",
	3: "金丹",
	4: "元婴",
	5: "化神",
	6: "炼虚",
	7: "合体",
	8: "大乘",
	9: "渡劫"
}
const LEVEL_STAGE_MAP = {
	0: "入门",
	1: "初期",
	2: "中期",
	3: "后期",
	4: "大后期",
	5: "圆满"
}
## 获取等级对应的称号
static func get_level_title(level:int):
	if level/10 == 0:
		return LEVEL_MAP[0]  # 凡人
	if level/10 >= 9:
		return LEVEL_MAP[9]  # 渡劫
	return LEVEL_MAP[level/10]
## 获取等级对应的色彩
static func get_level_color(level:int):
	if level/10 == 0:
		return Color(0.6, 0.6, 0.6)  # 凡人
	if level/10 >= 9:
		return Color(1, 0, 1)  # 渡劫
	return get_grade_color(level/10)
## 获取等级对应的色彩code
static func get_level_color_code(level:int):
	if level/10 == 0:
		return "#999999"  # 凡人
	if level/10 >= 9:
		return "#FF00FF"  # 渡劫
	return get_grade_color_code(level/10)



## 获取等级对应的阶段
static func get_level_stage(level:int):
	if level%10/2 == 0:
		return LEVEL_STAGE_MAP[0]  # 入门
	if level%10/2 == 5:
		return LEVEL_STAGE_MAP[5]  # 圆满
	return LEVEL_STAGE_MAP[level % 10 / 2]

############## 数字转换 ##############
# 将数字转换为中文
static func number_to_chinese(number: int) -> String:
	var chinese = "" # 存储中文数字
	var digits = ["〇", "一", "二", "三", "四", "五", "六", "七", "八", "九"] # 中文数字列表

	var number_str = str(number) # 将数字转换为字符串

	for i in range(number_str.length()): # 遍历数字字符串
		var num = int(number_str[i]) # 获取当前数字

		if num == 0 and chinese != "" and chinese[-1] == "〇": # 如果当前数字为0且前一个字符为"〇"，则跳过
			continue
		else:
			chinese += digits[num] # 否则将中文数字添加到chinese中

	return chinese # 返回中文数字字符串    
