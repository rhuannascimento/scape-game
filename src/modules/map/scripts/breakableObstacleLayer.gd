extends TileMapLayer

@export var explosion_radius := 90.0

func explode_at_world_position(world_pos: Vector2):
	var local_pos := to_local(world_pos)
	var center_cell := local_to_map(local_pos)

	var tile_size := tile_set.tile_size.x
	var cell_radius := int(ceil(explosion_radius / tile_size))

	for x in range(-cell_radius, cell_radius + 1):
		for y in range(-cell_radius, cell_radius + 1):
			var cell := center_cell + Vector2i(x, y)

			var tile_data := get_cell_tile_data(cell)
			if tile_data:
				erase_cell(cell)
