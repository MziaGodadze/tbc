push = require 'push'
Class = require 'class'

WINDOW_HEIGHT = 1380
WINDOW_WIDTH = 820

VIRTUAL_WIDTH = 748
VIRTUAL_HEIGHT = 445

player_x = 200
player_y = 80

function love.load()
     io.stdout:setvbuf("no") 

    medium_font = love.graphics.newFont('pixel.ttf', 8)
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_HEIGHT, VIRTUAL_WIDTH, WINDOW_WIDTH, WINDOW_HEIGHT, {
           fullscreen = false,
           vsync = true,
           resizable = false,
    })

    love.graphics.setFont(medium_font)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.update()

    if love.keyboard.isDown('w') then
        player_y = player_y + 10 
    end
    if love.keyboard.isDown('s') then
        player_y = player_y - 10
    end
    if love.keyboard.isDown('a') then
        player_y = player_y - 10
    end
    if love.keyboard.isDown('d') then
        player_y = player_y + 10 
    end
    if love.keyboard.isDown('up') then
    player_x = player_x + 10
    end
    if love.keyboard.isDown('down') then
        player_x = player_x - 10
    end
    if love.keyboard.isDown('left') then
        player_x = player_x - 10
    end
    if love.keyboard.isDown('right') then
        player_x = player_x + 10
    end
    if love.keyboard.isDown('space') then
        player_y = player_y + 10
        player_x = player_x + 10
    end
end

function love.draw()
        push:start()

        love.graphics.clear(0/255, 72/255, 140/255, 255/255)   

        love.graphics.printf(
               'WELCOME!',
                0,
                10,
                VIRTUAL_WIDTH,
                'center')
            love.graphics.rectangle('fill', player_y, 20, 20, 20, 20)        
            love.graphics.rectangle('fill', player_x, 10, 10, 10, 10)
            love.graphics.rectangle('fill', 150, 15, 600, 1)
    push:finish()

end
