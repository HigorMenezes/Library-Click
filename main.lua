click = require("Click")

function love.load()
	love.graphics.setBackgroundColor(170, 170, 170)
	click:newRectangleButton({
		Class = "play",
		label = {text = "PLAY", size = 70, font = "font/FrancoisOne-Regular.ttf", color = {r = 0, g = 0, b = 0, a = 255}}, 
		button = {x = 200, y = 200, width = 400, height = 100, radius =  30, color = {r = 255, g = 255, b = 255, a = 255}},
		border = {width = 2 , color = {r = 0, g = 0, b = 0, a = 255}},
		func = function ()
			love.graphics.setBackgroundColor(love.math.random(0, 255), love.math.random(0, 255), love.math.random(0, 255))
		end
		})
end

function love.update(dt)
	click:update(dt)
end

function love.draw()
	click:draw()
end


