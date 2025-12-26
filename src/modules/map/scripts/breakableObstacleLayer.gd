extends TileMapLayer

func explode_at_world_position(world_pos: Vector2, damage_radius: float):
	var local_pos := to_local(world_pos)
	var center_cell := local_to_map(local_pos)

	var tile_size := tile_set.tile_size.x
	
	var cell_radius := int(ceil(damage_radius / tile_size))

	for x in range(-cell_radius, cell_radius + 1):
		for y in range(-cell_radius, cell_radius + 1):
			var cell := center_cell + Vector2i(x, y)

			var tile_data := get_cell_tile_data(cell)
			if tile_data:
				erase_cell(cell)
