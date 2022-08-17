extends Node

# confused

func readom_step():
    var UP = randi()%2
    var DOWN = randi()%2
    var LEFT = randi()%2
    var RIGHT = randi()%2
    var dir = Vector2(RIGHT-LEFT, DOWN-UP)
    owner.setp(dir)

func Grab():
    pass