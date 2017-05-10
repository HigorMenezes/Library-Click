click = require("Click")

function love.load()
	love.graphics.setBackgroundColor(170, 170, 170)
	click:newRectangleButton({
		ID = "play",
		label = {text = "PLAY", size = 70, font = "font/FrancoisOne-Regular.ttf"}, 
		button = {x = 200, y = 200, width = 400, height = 100, radius =  50}, 
		color = {r = 255, g = 255, b = 255, a = 255}
		})
end

function love.update(dt)
	click:update(dt)
end

function love.draw()
	click:draw()
end

