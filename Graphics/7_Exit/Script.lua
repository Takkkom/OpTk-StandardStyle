--func:DrawText(x, y, text)
--func:DrawNum(x, y, num)
--func:AddGraph("filename")
--func:DrawGraph(x, y, filename)
--func:DrawRectGraph(x, y, rect_x, rect_y, rect_width, rect_height, filename)
--func:DrawGraphCenter(x, y, filename)
--func:DrawGraphRectCenter(x, y, rect_x, rect_y, rect_width, rect_height, filename)
--func:SetOpacity(opacity, "filename")
--func:SetRotation(angle, "fileName")
--func:SetScale(xscale, yscale, "filename")
--func:SetColor(r, g, b, "filename")

local width = 1920
local height = 1080

local counter = 0

local bg1_x = 0
local text1_y_v = 0

local credit1_opacity = 0
local credit2_opacity = 0

function clearIn(player)
end

function clearOut(player)
end

function init()
    func:AddGraph("Background1.png")
    func:AddGraph("Text1.png")
    func:AddGraph("Credit1.png")
    func:AddGraph("Credit2.png")

    counter = 0
    bg1_x = width
    text1_y_v = 0
    credit1_opacity = 0
    credit2_opacity = 0
end

function update()
    counter = counter + deltaTime

    if bg1_x > 0 then
        bg1_x = bg1_x - (width * 1.5 * deltaTime)
    else
        bg1_x = 0
    end
    
    if text1_y_v < 1 then
        text1_y_v = text1_y_v + deltaTime
    else
        text1_y_v = 1
    end

    if counter > 3 then
        credit1_opacity = credit1_opacity + (2 * deltaTime)
    end
    if counter > 6 then
        credit2_opacity = credit2_opacity + (2 * deltaTime)
    end

end

function draw()
    func:DrawGraph(bg1_x, 0, "Background1.png")

    text1_y = (-1.0 + math.sin(text1_y_v * math.pi / 2.0)) * height

    func:DrawGraph(0, text1_y, "Text1.png")

    func:SetOpacity(credit1_opacity * 255, "Credit1.png")
    func:DrawGraph(0, 0, "Credit1.png")

    func:SetOpacity(credit2_opacity * 255, "Credit2.png")
    func:DrawGraph(0, 0, "Credit2.png")
end
