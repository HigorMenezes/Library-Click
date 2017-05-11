click = require("Click")

function love.load()
	love.graphics.setBackgroundColor(200, 200, 200)
	click:newRectangleButton({
		class = "menu",
		label = {text = "PLAY"}, 
		shape = {x = 200, y = 200, width = 400, height = 100},
		func = function ()
			love.graphics.setBackgroundColor(180, 180, 180)
		end
		})

	click:newRectangleButton({
		class = "menu",
		label = {text = "OPTION"}, 
		shape = {x = 200, y = 320, width = 400, height = 100},
		func = function ()
			love.graphics.setBackgroundColor(140, 140, 140)
		end
		})

	click:setLabelRectangleButton("menu", {label={size=50,font = "font/FrancoisOne-Regular.ttf",color={r=0,g=0,b=0,a=255}}})
	click:setShapeRectangleButton("menu", {shape={radius=15,color={r=255,g=255,b=255,a=255}}})
	click:setBorderRectangleButton("menu", {border={width = 2, color = {r = 0, g = 0, b = 0, a = 255}}})
	click:setHoverRectangleButton("menu", {hover={color = {r = 120, g = 120, b = 120, a = 90}}})
	click:setShadowRectangleButton("menu", {shadow={top=0,right=5,down=5,left=0,color={r=70,g=70,b=70,a=40}}})


end

function love.update(dt)
	click:update(dt)
end

function love.draw()
	click:draw()
end