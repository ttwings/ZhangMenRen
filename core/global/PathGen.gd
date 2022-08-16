extends Node

var map = AStar2D.new()
# 用100 * 100 大小，方便检验算法
var bounds = Vector2(100, 100)
# 可以通行的地板floors
var floor_cells = []
# dirty cells made by blocking objects
var dirty_cells = {}
# blocked cells made by blocking objects
var block_cells = []

func find_path(from,to):
    from = xy_to_id(from)
    to = xy_to_id(to)
    var path = map.get_point_path(from, to)
    return path


# x、y 坐标和 id 之间转换
func xy_to_id(cell):
    return cell.x * bounds.y + cell.y

func id_to_xy(id):
    var x = int(id / bounds.y)
    var y = int(id % int(bounds.y))
    return Vector2(x,y)

# clear dirty cells
func clear_dirty_cells():
    var cells = dirty_cells.keys()
    while not cells.empty():
        var cell = cells[0]
        var id = xy_to_id(cell)
        var is_dirty_point = dirty_cells[cell]
        # scan neighbors
        for nx in range(-1,2):
            for ny in range(-1,2):
                var nid = xy_to_id(Vector2(cell.x + nx, cell.y + ny))
                if id != nid and id in floor_cells and nid in floor_cells:
                    if not is_dirty_point:
                        if not map.are_points_connected(id, nid):
                            map.connect_points(id, nid)
                    else:
                        if map.are_points_connected(id, nid):
                            map.disconnect_points(id, nid)
        # remove cell off the list
        cells.remove(0)
        dirty_cells.erase(cell)


# build map
func build_map(bounds,floor_cells):
    bounds = bounds
    floor_cells = floor_cells
    map.clear()
    for cell in floor_cells:
        map.add_point(xy_to_id(cell),cell)
    for x in range(bounds.x):
        for y in range(bounds.y):
            var p = Vector2(x,y)
            if p in floor_cells:
                # scan neighbors
                for nx in range(-1,2):
                    for ny in range(-1,2):
                        var np = Vector2(x+nx,y+ny)
                        # if neighbor is also floor
                        if np in floor_cells:
                            var pid = xy_to_id(p)
                            var nid = xy_to_id(np)
                            # create new connections
                            if pid != nid and not map.are_points_connected(pid, nid):
                                map.add_point_connection(pid, nid)
                                map.add_point_connection(nid, pid)