--[[



]]

local world_gen = {}

function world_gen.create(size)
	local self = {}
		  self.outputTable = {}
		  self.seeds = {}
		  self.weights = {}
		  self.scales = {}


		  for i = 1, 10 do
		  	local weight = 1/(2^i)
		  	table.insert(self.weights, weight)
		  end

		  for i = 1, 10 do
		  	local scale = 0.005*2^i
		  	table.insert(self.scales,scale)
		  end

		  math.randomseed(os.time())

		  for i = 1, 10 do
		  	table.insert(self.seeds, math.random())
		  end

		  local pixel 
		  for x = 1, size do
		  	self.outputTable[x] = {}
		  	for y = 1, size do
		  		pixel = 0
		  		for o = 1, 10 do
		  			pixel = pixel + self.weights[o] * love.math.noise((x + self.seeds[o]) * self.scales[o], (y + self.seeds[o]) * self.scales[o])
		  		end
		  		self.outputTable[x][y] = pixel
		  	end
		  end
		return self.outputTable
end



return world_gen