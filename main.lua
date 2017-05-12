click = require("Click")

varY = 200

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

	click:setLabelRectangleButton("menu", {label={size = 30, file = "font/FrancoisOne-Regular.ttf",color={r=0,g=0,b=0,a=255}}})
	click:setShapeRectangleButton("menu", {shape={radius=50,color={r=255,g=255,b=255,a=255}}})
	click:setBorderRectangleButton("menu", {border={width = 2, color = {r = 0, g = 0, b = 0, a = 255}}})
	click:setHoverRectangleButton("menu", {hover={color = {r = 120, g = 120, b = 120, a = 90}}})
	click:setShadowRectangleButton("menu", {shadow={top=0,right=5,down=5,left=0,color={r=70,g=70,b=70,a=40}}})

	click:newArcButton({
		class = "menu",
		label = {text = "Button", space = math.rad(10), file = "font/FrancoisOne-Regular.ttf", size=30, color={r=0,g=0,b=0,a=255} },
		shape = {x = love.graphics.getWidth()/2, y = love.graphics.getHeight(), radius = love.graphics.getHeight() - 90, width = 120, 
			startAng = math.rad(-60), finalAng = math.rad(-120), color = {r = 255, g = 255, b = 255, a = 255}},
		border= {width = 2, color = {r = 0, g = 0, b = 0, a = 255}},
		shadow= {verticalDeslocation = -10, right = math.rad(1), left = math.rad(1),color = {r = 70, g = 70, b = 70,a =40}},
		func = function ()
			love.graphics.setBackgroundColor(100, 100, 100)
		end
		})

	
end

function love.update(dt)
	click:update(dt)
end

function love.draw()
	click:draw()
end