ui = {}

function ui.load()
    joys = {}
    -- Change these values to edit D-pad position--
    joys.S = 90
    joys.UX = 140
    joys.UY = 410
    -- End of editable values if you dont want to mess it up--
    joys.DX = joys.UX
    joys.DY = joys.UY + joys.S * 2
    joys.LX = joys.UX - joys.S
    joys.LY = joys.UY + joys.S
    joys.RX = joys.UX + joys.S
    joys.RY = joys.LY
end

function ui.draw()
    if up == true then
        love.graphics.setColor(255,0,0)
    else
        love.graphics.setColor(255,255,255)
    end
    love.graphics.rectangle("fill",joys.UX,joys.UY,joys.S,joys.S)
    love.graphics.setColor(255,255,255)
    love.graphics.rectangle("fill",joys.UX,joys.UY+joys.S,joys.S,joys.S)
    if down == true then
        love.graphics.setColor(255,0,0)
    else
        love.graphics.setColor(255,255,255)
    end
    love.graphics.rectangle("fill",joys.DX,joys.DY,joys.S,joys.S)
    if left == true then
        love.graphics.setColor(255,0,0)
    else        love.graphics.setColor(255,255,255)
    end
    love.graphics.rectangle("fill",joys.LX,joys.LY,joys.S,joys.S)
    if right == true then
        love.graphics.setColor(255,0,0)
    else
        love.graphics.setColor(255,255,255)
    end
    love.graphics.rectangle("fill",joys.RX,joys.RY,joys.S,joys.S)
    love.graphics.setColor(255,255,255)
end

function ui.update(dt)
    up = false
    down = false
    right = false
    left = false

    local X = love.mouse.getX()
    local Y = love.mouse.getY()
    
    if love.mouse.isDown(1) then
        if X > joys.RX and X < joys.RX + joys.S and Y > joys.RY and Y < joys.RY + joys.S then
            right = true
        end
        if X > joys.LX and X < joys.LX + joys.S and Y > joys.LY and Y < joys.LY + joys.S then
            left = true
        end
        if X > joys.UX and X < joys.UX + joys.S and Y > joys.UY and Y < joys.UY + joys.S then
            up = true
        end
        if X > joys.DX and X < joys.DX + joys.S and Y > joys.DY and Y < joys.DY + joys.S then
            down = true
        end
    end
end
