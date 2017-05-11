local Click = {}

local BASE = (...):match('(.-)[^%.]+$')

local fontDefault = BASE .. "/font/FrancoisOne-Regular.ttf"
local cursorHand = love.mouse.getSystemCursor("hand")
local flag = true
local hover = {false, false, 0}

local rectangleButtons = {}

function Click:newRectangleButton(param)
	local btn = {}

	btn.Class = param.Class or false

	btn.label = {}
	btn.label.text = param.label.text or "btn"
	btn.label.font = param.label.font or fontDefault
	btn.label.size = param.label.size or 16
	btn.label.color = {}
	btn.label.color.r = param.label.color.r or 0
	btn.label.color.g = param.label.color.g or 0
	btn.label.color.b = param.label.color.b or 0
	btn.label.color.a = param.label.color.a or 255

	btn.button = {}
	btn.button.x = param.button.x or 0
	btn.button.y = param.button.y or 0
	btn.button.width = param.button.width or 400
	btn.button.height = param.button.height or 100
	btn.button.radius = math.min(param.button.radius or 0, btn.button.height/2)
	btn.button.color = {}
	btn.button.color.r = param.button.color.r or 255
	btn.button.color.g = param.button.color.g or 255
	btn.button.color.b = param.button.color.b or 255
	btn.button.color.a = param.button.color.a or 255

	btn.border = {}
	btn.border.width = param.border.width or 2
	btn.border.color = {}
	btn.border.color.r = param.border.color.r or 0
	btn.border.color.g = param.border.color.g or 0
	btn.border.color.b = param.border.color.b or 0
	btn.border.color.a = param.border.color.a or 255

	btn.hover = {}
	btn.hover.color = {}
	btn.hover.color.r = param.hover.color.r or 170
	btn.hover.color.g = param.hover.color.g or 170
	btn.hover.color.b = param.hover.color.b or 170
	btn.hover.color.a = param.hover.color.a or 90

	btn.shadow = {}
	btn.shadow.top = param.shadow.top or 0
	btn.shadow.right = param.shadow.right or 0
	btn.shadow.down = param.shadow.down or 0
	btn.shadow.left = param.shadow.left or 0
	btn.shadow.color = {}
	btn.shadow.color.r = param.shadow.color.r or 170
	btn.shadow.color.g = param.shadow.color.g or 170
	btn.shadow.color.b = param.shadow.color.b or 170
	btn.shadow.color.a = param.shadow.color.a or 90


	btn.func = param.func 

	table.insert(rectangleButtons, btn)
end

function Click:draw()
	for i=1,#rectangleButtons do
		local r = rectangleButtons[i]
		--shadow
		love.graphics.setColor(r.shadow.color.r, r.shadow.color.g, r.shadow.color.b, r.shadow.color.a)
		love.graphics.rectangle("fill", (r.button.x - r.shadow.left), (r.button.y - r.shadow.top), 
			(r.button.width + r.shadow.left + r.shadow.right), (r.button.height + r.shadow.top + r.shadow.down), r.button.radius)
		-- Button
		love.graphics.setColor(r.button.color.r, r.button.color.g, r.button.color.b, r.button.color.a)
		love.graphics.rectangle("fill", r.button.x, r.button.y, r.button.width, r.button.height, r.button.radius)
		-- Hover
		if hover[1] and hover[2] == "rectangle" and hover[3] == i then
			love.graphics.setColor(r.hover.color.r, r.hover.color.g, r.hover.color.b, r.hover.color.a)
			love.graphics.rectangle("fill", r.button.x, r.button.y, r.button.width, r.button.height, r.button.radius)
		end
		--Border
		love.graphics.setLineWidth(r.border.width)
		love.graphics.setColor(r.border.color.r, r.border.color.g, r.border.color.b, r.border.color.a)
		love.graphics.rectangle("line", r.button.x, r.button.y, r.button.width, r.button.height, r.button.radius)
		--Label
		love.graphics.setColor(r.label.color.r, r.label.color.g, r.label.color.b, r.label.color.a)
		love.graphics.setFont(love.graphics.newFont(r.label.font, r.label.size))
		love.graphics.printf(r.label.text, r.button.x, r.button.y, r.button.width, "center")
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
		end
	end
	if not love.mouse.isDown(1) and not flag then
		flag = true
	end
end

function insideButton()
	x = love.mouse.getX()
	y = love.mouse.getY()

	for i=1,#rectangleButtons do
		local r = rectangleButtons[i].button
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
	return {false}
end

return Click