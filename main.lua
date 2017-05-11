click = require("Click")

function love.load()
	love.graphics.setBackgroundColor(200, 200, 200)
	click:newRectangleButton({
		Class = "play",
		label = {text = "PLAY", size = 80, font = "font/FrancoisOne-Regular.ttf", verticalAlign = "down", horizontalAlign = "left", 
			color = {r = 0, g = 0, b = 0, a = 255}}, 
		button = {x = 200, y = 200, width = 400, height = 100, radius =  15, color = {r = 255, g = 255, b = 255, a = 255}},
		border = {width = 2, color = {r = 0, g = 0, b = 0, a = 255}},
		hover = {color = {r = 170, g = 170, b = 170, a = 90}},
		shadow = {top = 10, right = 0, down = 0, left = 0, color = {r = 0, g = 0, b = 170, a = 255}},
		func = function ()
			love.graphics.setBackgroundColor(70, 70, 70)
		end
		})

	click:newRectangleButton({
		Class = "option",
		label = {text = "OPTION", size = 70, font = "font/FrancoisOne-Regular.ttf", verticalAlign = "top", horizontalAlign = "right", 
			color = {r = 255, g = 255, b = 255, a = 255}}, 
		button = {x = 200, y = 320, width = 400, height = 100, radius =  50, color = {r = 0, g = 0, b = 0, a = 255}},
		border = {width = 10, color = {r = 255, g = 255, b = 255, a = 255}},
		hover = {color = {r = 200, g = 200, b = 200, a = 90}},
		shadow = {top = 0, right = 0, down = 10, left = 0, color = {r = 170, g = 0, b = 0, a = 255}},
		func = function ()
			love.graphics.setBackgroundColor(140, 140, 140)
		end
		})
end

function love.update(dt)
	click:update(dt)
end

function love.draw()
	click:draw()
end