class_name Weather
# 天气类
# 信号 当天气改变时
signal on_weather_changed(current,new)
# 枚举天气类型
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

