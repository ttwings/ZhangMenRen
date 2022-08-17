extends Node

# 发送更新信号
signal actor_act

# 更新Actor
func actor_act():
    signal actor_update


# owner is MapView
func _ready():
    owner.map = self