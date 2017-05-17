click = require("Click")

varY = 200

function love.load()
	love.graphics.setBackgroundColor(200, 200, 200)
	
	button1 = click:newRectangleButton({
		class = "menu",
		label = {text = "Remove ARC"}, 
		shape = {x = 200, y = 200, width = 400, height = 100},
		func = function ()
			click:remove(button3)
		end
		})

	button2 = click:newRectangleButton({
		class = "menu",
		label = {text = "remove ALL"}, 
		shape = {x = 200, y = 320, width = 400, height = 100},
		func = function ()
			click:removeAll()
		end
		})

	button3 = click:newArcButton({
		class = "menu1",
		label = {text = "PLAY"},
		shape = {radius = love.graphics.getHeight()*2 - 100, startAng = math.rad(260), finalAng = math.rad(280)},
		border= {width = 2, color = {r = 0, g = 0, b = 0, a = 255}},
		func = function ()
		end
		})

	click:setLabelByClass("menu", {label={space=math.rad(5),size = 60, file = "font/FrancoisOne-Regular.ttf",color={r=0,g=0,b=0,a=255}}})
	click:setShapeByClass("menu", {shape={radius=50,color={r=255,g=255,b=255,a=255}}})
	click:setBorderByClass("menu", {border={width = 2, color = {r = 0, g = 0, b = 0, a = 255}}})
	click:setHoverByClass("menu", {hover={color = {r = 120, g = 120, b = 120, a = 90}}})
	click:setShadowByClass("menu", {shadow={top=0,right=5,down=5,left=0,color={r=70,g=70,b=70,a=40}}})

	click:setHoverByClass("menu1", {hover = {color = {r = 120, g = 120, b = 120, a = 90}}})
	click:setLabelByClass("menu1", {label = {space = math.rad(3.5), file = "font/FrancoisOne-Regular.ttf", size=70, 
		color={r=0,g=0,b=0,a=255}}})
	click:setShapeByClass("menu1", {shape = {x = love.graphics.getWidth()/2, y = love.graphics.getHeight()*2, width = 80, 
		color={r=255,g=255,b=255,a=255}}})
	click:setShadowByClass("menu1", {shadow = {verticalDeslocation = -5, right = math.rad(0.3), left = math.rad(0.3),
		color = {r=70,g=70,b=70,a=40}}})
	
end

function love.update(dt)
	click:update(dt)
end

function love.draw()
	click:draw()
end