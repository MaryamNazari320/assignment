
grid = Array.new(10).map{ |a| Array.new(10, :empty)}  #board layout

def pretty_grid(grid) #board layout prettier
	grid.each do |row|
		row.each do |cell|
			if cell == :empty
				print "."
			else
				print cell
			end
		end
		puts
	end
end

#given two randome  directions and the size of the ship we can check the cells to make sure they are empty, if so we place the ship if not we fail
def try_place_ship(grid, ship_size, label) 
	rand_row = rand(grid.size)
	rand_column = rand(grid[0].size) 
	rand_direction = rand(2)

	if rand_direction == 0  # here we chose 0 as horizontal direction

		# checks if possible to place horizontaly
		0.upto ship_size-1 do |col|
			if rand_column+col >= grid[0].size
				return false
			end
			if grid[rand_row][rand_column+col] != :empty
				return false
			end
		end

		# place horizontal
		0.upto ship_size-1 do |col|
			grid[rand_row][rand_column+col] = label
		end

	else
		# checks if possible to place vertical
		0.upto ship_size-1 do |row|
			if rand_row+row >= grid.size
				return false
			end
			if grid[rand_row+row][rand_column] != :empty
				return false
			end
		end

		# place vertical
		0.upto ship_size-1 do |row|
			grid[rand_row+row][rand_column] = label
		end
        
	end

	return true #yay placed it!
end

#given two randome  directions (h, v) and the size of the ship we can check the cells to make sure they are empty, if so we place the ship if not we fail
#we loop over this function until success 
#we make sure it fits the grid and space is available

def place_ship(grid, size, label)
	loop do
		# trying
		r = try_place_ship(grid, size, label) #not garuntee that it will return true this is because we are placing random
		if r
			break
		end
	end
end

ships = { T: 2, D: 3, S: 3, B: 4, A: 5}

ships.each do |label, size|
	place_ship(grid, size, label)
end

pretty_grid(grid)