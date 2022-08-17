extends TileMap


# map
var map

# 连接更新信号

func _ready():
    connect(

# 更新演员

func update():
    var  actor is in group("Actor"):
    actor.update()