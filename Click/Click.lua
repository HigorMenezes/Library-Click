local Click = {}

local BASE = (...):match('(.-)[^%.]+$')

local fontDefault = BASE .. "/font/FrancoisOne-Regular.ttf"
local cursorHand = love.mouse.getSystemCursor("hand")

local rectangleButtons = {}

function Click:newRectangleButton(param)
	local btn = {}

	btn.Class = param.Class or "none"

	btn.label = {}
	btn.label.text = param.label.text or "btn"
	btn.label.font = param.label.font or fontDefault
	btn.label.size = param.label.size or 16

	btn.button = {}
	btn.button.x = param.button.x or 0
	btn.button.y = param.button.y or 0
	btn.button.width = param.button.width or 400
	btn.button.height = param.button.height or 100
	btn.button.radius = math.min(param.button.radius or 0, btn.button.height/2)

	btn.color = {}
	btn.color.r = param.color.r or 255
	btn.color.g = param.color.g or 255
	btn.color.b = param.color.b or 255
	btn.color.a = param.color.a or 255

	table.insert(rectangleButtons, btn)
end

function Click:draw()
	for i=1,#rectangleButtons do
		local r = rectangleButtons[i]
		love.graphics.setColor(r.color.r, r.color.g, r.color.b, r.color.a)
		love.graphics.rectangle("fill", r.button.x, r.button.y, r.button.width, r.button.height, r.button.radius)

		love.graphics.setColor(0, 0, 0, 255)
		love.graphics.rectangle("line", r.button.x, r.button.y, r.button.width, r.button.height, r.button.radius)

		love.graphics.setColor(0, 0, 0, 255)
		love.graphics.setFont(love.graphics.newFont(r.label.font, r.label.size))
		love.graphics.printf(r.label.text, r.button.x, r.button.y, r.button.width, "center")
		--love.graphics.newText()
	end
end

function Click:update(dt)

	if inside() then
		love.mouse.setCursor(cursorHand)
	else
		love.mouse.setCursor()
	end

end

function inside()
	x = love.mouse.getX()
	y = love.mouse.getY()

	for i=1,#rectangleButtons do
		local r = rectangleButtons[i].button
		if x > r.x and x < r.x + r.width 
			and y > r.y and y < r.y + r.height then
			if r.radius > 0 
				and (x > r.x + r.radius and x < r.x + r.width - r.radius) 
				or (y > r.y + r.radius and y < r.y + r.height - r.radius) 
				or ((x - (r.x + r.radius))^2 + (y - (r.y + r.radius))^2)^(1/2) < r.radius 
				or ((x - (r.x - r.radius + r.width))^2 + (y - (r.y + r.radius))^2)^(1/2) < r.radius 
				or ((x - (r.x + r.radius))^2 + (y - (r.y + r.height - r.radius))^2)^(1/2) < r.radius 
				or ((x - (r.x - r.radius + r.width))^2 + (y - (r.y + r.height - r.radius))^2)^(1/2) < r.radius 
				then
				return true
			else
				return false
			end
			
		else
			return false
		end
	end
end

return Click