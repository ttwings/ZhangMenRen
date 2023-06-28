extends Node
class_name Weather
# 天气类
# 信号 当天气改变时
signal on_weather_changed(current,new)
# 枚举天气类型，包括晴天，雨天，阴天，雪天，风天，雾天
enum WeatherType{
	SUNNY,
	RAINY,
	CLOUDY,
	SNOWY,
	WINDY,
	FOGGY
}

# curret_weather 当前天气
var current_weather = WeatherType.SUNNY
# 切换天气
func change_weather(new_weather):
	current_weather = new_weather
	emit_signal("on_weather_changed",current_weather,new_weather)

# 获取当前天气
func get_current_weather():
	return current_weather

## 当前天气改变时，打印当前天气
func _on_weather_changed(current,new):
	print("current weather is %s" % current)

func _ready():
	if owner is Base:
		owner.add_append(self)
