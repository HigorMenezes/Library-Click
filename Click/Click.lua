local Click = {}

local BASE = (...):match('(.-)[^%.]+$')

local fontDefault = BASE .. "/font/FrancoisOne-Regular.ttf"

local buttons = {}

function Click:newButton(paramLabel, paramPos, paramColor)
	local button = {}

	button.label = {}
	button.label.text = paramLabel.text or ""
	button.label.font = paramLabel.font or fontDefault
	button.label.size = paramLabel.size or 16

	button.pos = {}
	button.pos.x = paramPos.x or 0
	button.pos.y = paramPos.y or 0
	button.pos.width = paramPos.width or 400
	button.pos.height = paramPos.height or 100
	button.pos.radius = paramPos.radius or 15

	button.color = {}
	button.color.r = paramColor.r or 255
	button.color.g = paramColor.g or 255
	button.color.b = paramColor.b or 255
	button.color.a = paramColor.a or 255

	table.insert(buttons, button)
end

function Click:draw()
	for i=1,#buttons do
		love.graphics.setColor(buttons[i].color.r, buttons[i].color.g, buttons[i].color.b, buttons[i].color.a)
		love.graphics.rectangle("fill", buttons[i].pos.x, buttons[i].pos.y, buttons[i].pos.width, buttons[i].pos.height, buttons[i].pos.radius)

		love.graphics.setColor(0, 0, 0, 255)
		love.graphics.rectangle("line", buttons[i].pos.x, buttons[i].pos.y, buttons[i].pos.width, buttons[i].pos.height, buttons[i].pos.radius)

		love.graphics.setColor(0, 0, 0, 255)
		love.graphics.setFont(love.graphics.newFont(buttons[i].label.font, buttons[i].label.size))
		love.graphics.printf(buttons[i].label.text, buttons[i].pos.x, buttons[i].pos.y, buttons[i].pos.width, "center")
	end
end

function Click:update(dt)
end

return Click