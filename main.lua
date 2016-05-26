local world_gen = require 'worldgen'

local world = {}

function love.load()

	world = world_gen.create(300)

end

function love.update(dt)


end

function love.draw()
for key, value in pairs(world) do
		for key2, value2 in pairs(world[key]) do
					love.graphics.setColor(value2*255,value2*255,value2*255)
					love.graphics.rectangle("fill",key,key2,1,1)
		end
	end

end
