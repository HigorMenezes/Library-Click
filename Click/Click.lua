local Click = {}

local BASE = (...):match('(.-)[^%.]+$')

local fileDefault = BASE .. "/font/FrancoisOne-Regular.ttf"
local cursorHand = love.mouse.getSystemCursor("hand")
local flag = true
local hover = {false, false, 0}

local rectangleButtons = {}
local arcButtons = {}

-- Create a rectangle button
function Click:newRectangleButton(param)
	local button = {}

	button.class = param.class or false

	button.label = {}
	param.label = param.label or {}
	button.label.text = param.label.text or "button"
	button.label.file = param.label.file or fileDefault
	button.label.size = param.label.size or 16
	button.label.font = love.graphics.newFont(button.label.file, button.label.size)
	button.label.verticalAlign = param.label.verticalAlign or "center"
	button.label.horizontalAlign = param.label.horizontalAlign or "center"
	button.label.color = {}
	param.label.color = param.label.color or {}
	button.label.color.r = param.label.color.r or 0
	button.label.color.g = param.label.color.g or 0
	button.label.color.b = param.label.color.b or 0
	button.label.color.a = param.label.color.a or 255

	button.shape = {}
	param.shape = param.shape or {}
	button.shape.x = param.shape.x or 0
	button.shape.y = param.shape.y or 0
	button.shape.width = param.shape.width or 400
	button.shape.height = param.shape.height or 100
	button.shape.radius = math.min(param.shape.radius or 0, button.shape.height/2)
	button.shape.color = {}
	param.shape.color = param.shape.color or {}
	button.shape.color.r = param.shape.color.r or 255
	button.shape.color.g = param.shape.color.g or 255
	button.shape.color.b = param.shape.color.b or 255
	button.shape.color.a = param.shape.color.a or 255

	button.border = {}
	param.border = param.border or {}
	button.border.width = param.border.width or 0
	button.border.color = {}
	param.border.color = param.border.color or {}
	button.border.color.r = param.border.color.r or 0
	button.border.color.g = param.border.color.g or 0
	button.border.color.b = param.border.color.b or 0
	button.border.color.a = param.border.color.a or 0

	button.hover = {}
	param.hover = param.hover or {}
	button.hover.color = {}
	param.hover.color = param.hover.color or {}
	button.hover.color.r = param.hover.color.r or 170
	button.hover.color.g = param.hover.color.g or 170
	button.hover.color.b = param.hover.color.b or 170
	button.hover.color.a = param.hover.color.a or 90

	button.shadow = {}
	param.shadow = param.shadow or {}
	button.shadow.top = param.shadow.top or 0
	button.shadow.right = param.shadow.right or 0
	button.shadow.down = param.shadow.down or 0
	button.shadow.left = param.shadow.left or 0
	button.shadow.color = {}
	param.shadow.color = param.shadow.color or {}
	button.shadow.color.r = param.shadow.color.r or 170
	button.shadow.color.g = param.shadow.color.g or 170
	button.shadow.color.b = param.shadow.color.b or 170
	button.shadow.color.a = param.shadow.color.a or 90

	button.func = param.func or function() end

	table.insert(rectangleButtons, button)
end

function Click:newArcButton(param)
	local button = {}

	button.class = param.class or false

	button.label = {}
	param.label = param.label or {}
	button.label.text = param.label.text or "button"
	button.label.space = param.label.space or math.rad(5)
	button.label.file = param.label.file or fileDefault
	button.label.size = param.label.size or 16
	button.label.font = love.graphics.newFont(button.label.file, button.label.size)
	--button.label.verticalAlign = param.label.verticalAlign or "center"
	--button.label.horizontalAlign = param.label.horizontalAlign or "center"
	button.label.color = {}
	param.label.color = param.label.color or {}
	button.label.color.r = param.label.color.r or 0
	button.label.color.g = param.label.color.g or 0
	button.label.color.b = param.label.color.b or 0
	button.label.color.a = param.label.color.a or 255
	button.label.tabText = {}
	for i=1,string.len(button.label.text) do
		table.insert(button.label.tabText, string.sub(button.label.text, i, i))
	end

	button.shape = {}
	param.shape = param.shape or {}
	button.shape.x = param.shape.x or 0
	button.shape.y = param.shape.y or 0
	button.shape.radius = param.shape.radius or 400
	button.shape.width = param.shape.width or 40
	button.shape.startAng = param.shape.startAng or math.rad(200)
	button.shape.finalAng = param.shape.finalAng or math.rad(340)
	button.shape.color = {}
	param.shape.color = param.shape.color or {}
	button.shape.color.r = param.shape.color.r or 255
	button.shape.color.g = param.shape.color.g or 255
	button.shape.color.b = param.shape.color.b or 255
	button.shape.color.a = param.shape.color.a or 255
	-- Requirements
	if button.shape.startAng < 0 then
		button.shape.startAng = button.shape.startAng + math.rad(360)
	end
	if button.shape.finalAng < 0 then
		button.shape.finalAng = button.shape.finalAng + math.rad(360)
	end
	if button.shape.startAng > button.shape.finalAng then
		local aux = button.shape.startAng
		button.shape.startAng = button.shape.finalAng
		button.shape.finalAng = aux
	end

	button.border = {}
	param.border = param.border or {}
	button.border.width = param.border.width or 0
	button.border.color = {}
	param.border.color = param.border.color or {}
	button.border.color.r = param.border.color.r or 0
	button.border.color.g = param.border.color.g or 0
	button.border.color.b = param.border.color.b or 0
	button.border.color.a = param.border.color.a or 0

	button.hover = {}
	param.hover = param.hover or {}
	button.hover.color = {}
	param.hover.color = param.hover.color or {}
	button.hover.color.r = param.hover.color.r or 170
	button.hover.color.g = param.hover.color.g or 170
	button.hover.color.b = param.hover.color.b or 170
	button.hover.color.a = param.hover.color.a or 90

	button.shadow = {}
	param.shadow = param.shadow or {}
	button.shadow.verticalDeslocation = param.shadow.verticalDeslocation or 0
	button.shadow.right = param.shadow.right or math.rad(0)
	button.shadow.left = param.shadow.left or math.rad(0)
	button.shadow.color = {}
	param.shadow.color = param.shadow.color or {}
	button.shadow.color.r = param.shadow.color.r or 170
	button.shadow.color.g = param.shadow.color.g or 170
	button.shadow.color.b = param.shadow.color.b or 170
	button.shadow.color.a = param.shadow.color.a or 90

	button.func = param.func or function() end

	table.insert(arcButtons, button)
end

function Click:setLabelRectangleButton(class, param)
	label = param.label or {}
	label.color = label.color or {}

	for i=1,#rectangleButtons do
		if rectangleButtons[i].class == class then
			local r = rectangleButtons[i].label
			r.text = label.text or r.text
			r.size = label.size or r.size
			r.file = label.file or r.file
			r.font = love.graphics.newFont(r.file, r.size)
			r.verticalAlign = label.verticalAlign or r.verticalAlign
			r.horizontalAlign = label.horizontalAlign or r.horizontalAlign
			r.color.r = label.color.r or r.color.r
			r.color.g = label.color.g or r.color.g
			r.color.b = label.color.b or r.color.b
			r.color.a = label.color.a or r.color.a
		end
	end
end

function Click:setShapeRectangleButton(class, param)
	shape = param.shape or {}
	shape.color = shape.color or {}

	for i=1,#rectangleButtons do
		if rectangleButtons[i].class == class then
			local r = rectangleButtons[i].shape
			r.x = shape.x or r.x
			r.y = shape.y or r.y
			r.width = shape.width or r.width
			r.height = shape.height or r.height
			r.radius = shape.radius or r.radius
			r.color.r = shape.color.r or r.color.r
			r.color.g = shape.color.g or r.color.g
			r.color.b = shape.color.b or r.color.b
			r.color.a = shape.color.a or r.color.a
		end
	end
end

function Click:setBorderRectangleButton(class, param)
	border = param.border or {}
	border.color = border.color or {}

	for i=1,#rectangleButtons do
		if rectangleButtons[i].class == class then
			local r = rectangleButtons[i].border
			r.width = border.width or r.width
			r.color.r = border.color.r or r.color.r
			r.color.g = border.color.g or r.color.g
			r.color.b = border.color.b or r.color.b
			r.color.a = border.color.a or r.color.a
		end
	end
end

function Click:setHoverRectangleButton(class, param)
	hover = param.hover or {}
	hover.color = hover.color or {}

	for i=1,#rectangleButtons do
		if rectangleButtons[i].class == class then
			local r = rectangleButtons[i].hover
			r.color.r = hover.color.r or r.color.r
			r.color.g = hover.color.g or r.color.g
			r.color.b = hover.color.b or r.color.b
			r.color.a = hover.color.a or r.color.a
		end
	end
end

function Click:setShadowRectangleButton(class, param)
	shadow = param.shadow or {}
	shadow.color = shadow.color or {}

	for i=1,#rectangleButtons do
		if rectangleButtons[i].class == class then
			local r = rectangleButtons[i].shadow
			r.top = shadow.top or r.top
			r.down = shadow.down or r.down
			r.right = shadow.right or r.right
			r.left = shadow.left or r.left
			r.color.r = shadow.color.r or r.color.r
			r.color.g = shadow.color.g or r.color.g
			r.color.b = shadow.color.b or r.color.b
			r.color.a = shadow.color.a or r.color.a
		end
	end
end

function Click:setFuncRectangleButton(class, param)
	func = param.func or function() end

	for i=1,#rectangleButtons do
		local r = rectangleButtons[i]
		if r.class == class then
			r.func = func or r.func
		end
	end
end


-- CALL BACKS -------------------------------------
function Click:draw()
	--RectangleButtons
	for i=1,#rectangleButtons do
		local r = rectangleButtons[i]
		--shadow
		love.graphics.setColor(r.shadow.color.r, r.shadow.color.g, r.shadow.color.b, r.shadow.color.a)
		love.graphics.rectangle("fill", (r.shape.x - r.shadow.left), (r.shape.y - r.shadow.top), 
			(r.shape.width + r.shadow.left + r.shadow.right), (r.shape.height + r.shadow.top + r.shadow.down), r.shape.radius)
		-- Shape
		love.graphics.setColor(r.shape.color.r, r.shape.color.g, r.shape.color.b, r.shape.color.a)
		love.graphics.rectangle("fill", r.shape.x, r.shape.y, r.shape.width, r.shape.height, r.shape.radius)
		-- Hover
		if hover[1] and hover[2] == "rectangle" and hover[3] == i then
			love.graphics.setColor(r.hover.color.r, r.hover.color.g, r.hover.color.b, r.hover.color.a)
			love.graphics.rectangle("fill", r.shape.x, r.shape.y, r.shape.width, r.shape.height, r.shape.radius)
		end
		--Border
		love.graphics.setLineWidth(r.border.width)
		love.graphics.setColor(r.border.color.r, r.border.color.g, r.border.color.b, r.border.color.a)
		love.graphics.rectangle("line", r.shape.x, r.shape.y, r.shape.width, r.shape.height, r.shape.radius)
		--Label
		love.graphics.setColor(r.label.color.r, r.label.color.g, r.label.color.b, r.label.color.a)
		local text = love.graphics.newText(r.label.font, r.label.text)
		local x, y = 0, 0

		if r.label.horizontalAlign == "left" then
			x = r.shape.x + text:getWidth()/2 + r.border.width
		elseif r.label.horizontalAlign == "center" then
			x = r.shape.x + r.shape.width/2
		else
			x = r.shape.x + r.shape.width - text:getWidth()/2 - r.border.width
		end

		if r.label.verticalAlign == "top" then
			y = r.shape.y + text:getHeight()/2 + (r.border.width/2)
		elseif r.label.verticalAlign == "center" then
			y = r.shape.y + r.shape.height/2
		else
			y = r.shape.y + r.shape.height - text:getHeight()/2 - (r.border.width/2)
		end

		love.graphics.draw(text, x, y, 0, 1, 1, text:getWidth()/2, text:getHeight()/2)
	end

	-- ArcButtons
	for i=1,#arcButtons do
		local r = arcButtons[i]

		--shadow
		love.graphics.setColor(r.shadow.color.r, r.shadow.color.g, r.shadow.color.b, r.shadow.color.a)
		love.graphics.setLineWidth(r.shape.width + math.abs(r.shadow.verticalDeslocation))
		love.graphics.arc("line", "open", r.shape.x, r.shape.y, r.shape.radius + r.shadow.verticalDeslocation, r.shape.startAng - r.shadow.left, r.shape.finalAng + r.shadow.right)

		--Shape
		love.graphics.setColor(r.shape.color.r, r.shape.color.g, r.shape.color.b, r.shape.color.a)
		love.graphics.setLineWidth(r.shape.width)
		love.graphics.arc("line", "open", r.shape.x, r.shape.y, r.shape.radius, r.shape.startAng, r.shape.finalAng)	

		--Hover
		if hover[1] and hover[2] == "arc" and hover[3] == i then
			love.graphics.setColor(r.hover.color.r, r.hover.color.g, r.hover.color.b, r.hover.color.a)
			love.graphics.arc("line", "open", r.shape.x, r.shape.y, r.shape.radius, r.shape.startAng, r.shape.finalAng)	
		end

		--border
		love.graphics.setLineWidth(r.border.width)
		love.graphics.setColor(r.border.color.r, r.border.color.g, r.border.color.b, r.border.color.a)
		love.graphics.arc("line", "open", r.shape.x, r.shape.y, r.shape.radius + r.shape.width/2, r.shape.startAng, r.shape.finalAng)	
		love.graphics.arc("line", "open", r.shape.x, r.shape.y, r.shape.radius - r.shape.width/2, r.shape.startAng, r.shape.finalAng)
		love.graphics.line((r.shape.x + math.cos(r.shape.startAng)*(r.shape.radius - r.shape.width/2 - r.border.width/2)) , 
			(r.shape.y + math.sin(r.shape.startAng)*(r.shape.radius - r.shape.width/2 - r.border.width/2)) ,
			r.shape.x + math.cos(r.shape.startAng)*(r.shape.radius + r.shape.width/2 + r.border.width/2), 
			r.shape.y + math.sin(r.shape.startAng)*(r.shape.radius + r.shape.width/2 + r.border.width/2))
		love.graphics.line(r.shape.x + math.cos(r.shape.finalAng)*(r.shape.radius - r.shape.width/2 - r.border.width/2), 
			r.shape.y + math.sin(r.shape.finalAng)*(r.shape.radius - r.shape.width/2 - r.border.width/2),
			r.shape.x + math.cos(r.shape.finalAng)*(r.shape.radius + r.shape.width/2 + r.border.width/2), 
			r.shape.y + math.sin(r.shape.finalAng)*(r.shape.radius + r.shape.width/2 + r.border.width/2))

		--Label
		love.graphics.setColor(r.label.color.r, r.label.color.g, r.label.color.b, r.label.color.a)
		local center = (r.shape.startAng + r.shape.finalAng)/2
		local stringAng = r.label.space * string.len(r.label.text)
		for i=1,#r.label.tabText do
			local text = love.graphics.newText(r.label.font, r.label.tabText[i])
			love.graphics.draw(text, r.shape.x+(math.cos((center - stringAng/2 + r.label.space/2)+r.label.space*(i-1))*r.shape.radius), r.shape.y+(math.sin((center - stringAng/2 + r.label.space/2)+r.label.space*(i-1))*r.shape.radius), math.rad(90)+(center - stringAng/2 + r.label.space/2)+r.label.space*(i-1), 1, 1, text:getWidth()/2, text:getHeight()/2)
		end



	end
end

function Click:update(dt)
	-- MUDA O CURSOR
	local inside = insideButton()
	if inside[1] then
		love.mouse.setCursor(cursorHand)
		hover = inside
	else
		love.mouse.setCursor()
		hover = {false, false, 0}
	end
	-- Executa a função do botão
	if love.mouse.isDown(1) and cursorHand == love.mouse.getCursor() and flag then
		flag = false
		if inside[2] == "rectangle" then
			rectangleButtons[inside[3]]:func()
		elseif inside[2] == "arc" then
			arcButtons[inside[3]]:func()
		end
	end
	if not love.mouse.isDown(1) and not flag then
		flag = true
	end
end

function insideButton()
	x = love.mouse.getX()
	y = love.mouse.getY()

	-- Inside in rectangle
	for i=1,#rectangleButtons do
		local r = rectangleButtons[i].shape
		if x > r.x and x < r.x + r.width and y > r.y and y < r.y + r.height then
			if r.radius > 0 then
				if (x > r.x + r.radius and x < r.x + r.width - r.radius) 
					or (y > r.y + r.radius and y < r.y + r.height - r.radius) 
					or ((x - (r.x + r.radius))^2 + (y - (r.y + r.radius))^2)^(1/2) < r.radius 
					or ((x - (r.x - r.radius + r.width))^2 + (y - (r.y + r.radius))^2)^(1/2) < r.radius 
					or ((x - (r.x + r.radius))^2 + (y - (r.y + r.height - r.radius))^2)^(1/2) < r.radius 
					or ((x - (r.x - r.radius + r.width))^2 + (y - (r.y + r.height - r.radius))^2)^(1/2) < r.radius then
					return {true, "rectangle", i}
				end
			else
				return {true, "rectangle", i}
			end	
		end
	end

	--inside in arc
	for i=1,#arcButtons do
		local r = arcButtons[i].shape
		local radiusMax = r.radius + r.width/2
		local radiusMin = r.radius - r.width/2
		local distance = ((x - r.x)^2 + (y - r.y)^2)^(1/2)

		local ang 
		if y - r.y > 0 then
			ang = math.acos((x-r.x)/distance)
		else
			ang = math.acos((r.x-x)/distance) + math.rad(180)
		end
		--print("MOUSE ANG: " .. ang .. " INITIAL: ".. r.startAng .. " FINAL: " .. r.finalAng)

		if distance < radiusMax and distance > radiusMin and ang > r.startAng and ang < r.finalAng then
			return {true, "arc", i}
		end

	end

	return {false}
end
---------------------------------------------------------------------------

return Click