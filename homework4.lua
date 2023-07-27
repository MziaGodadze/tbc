
local player1 = {}
local player2 = {}
local showWelcome = true

function love.load()
    love.window.setTitle("Two Players Game")
    love.window.setMode(800, 600)
    love.graphics.setBackgroundColor(205, 255, 255) -- Set background color to light blue

    -- Initialize player 1 (circle)
    player1.x = 100
    player1.y = 100
    player1.radius = 30
    player1.speed = 200
    player1.color = {255, 0, 0} -- Red color

    -- Initialize player 2 (rectangle)
    player2.x = 700
    player2.y = 500
    player2.width = 40
    player2.height = 60
    player2.speed = 200
    player2.color = {0, 0, 255} -- Blue color
end

function love.update(dt)
    if not showWelcome then
        -- Player 1 movement (WASD keys)
        if love.keyboard.isDown("w") then
            player1.y = player1.y - player1.speed * dt
        elseif love.keyboard.isDown("s") then
            player1.y = player1.y + player1.speed * dt
        elseif love.keyboard.isDown("a") then
            player1.x = player1.x - player1.speed * dt
        elseif love.keyboard.isDown("d") then
            player1.x = player1.x + player1.speed * dt
        end

        -- Player 2 movement (arrow keys)
        if love.keyboard.isDown("up") then
            player2.y = player2.y - player2.speed * dt
        elseif love.keyboard.isDown("down") then
            player2.y = player2.y + player2.speed * dt
        elseif love.keyboard.isDown("left") then
            player2.x = player2.x - player2.speed * dt
        elseif love.keyboard.isDown("right") then
            player2.x = player2.x + player2.speed * dt
        end

        -- Check boundaries
        player1.x = math.max(player1.x, player1.radius)
        player1.x = math.min(player1.x, love.graphics.getWidth() - player1.radius)
        player1.y = math.max(player1.y, player1.radius)
        player1.y = math.min(player1.y, love.graphics.getHeight() - player1.radius)

        player2.x = math.max(player2.x, 0)
        player2.x = math.min(player2.x, love.graphics.getWidth() - player2.width)
        player2.y = math.max(player2.y, 0)
        player2.y = math.min(player2.y, love.graphics.getHeight() - player2.height)
    end
end

function love.keypressed(key)
    if showWelcome and key == "return" then
        showWelcome = false
    end
end

function love.draw()
    if showWelcome then
        love.graphics.setColor(0, 0, 0) -- Black color for text
        love.graphics.print("Welcome to my game", 300, 280)
        love.graphics.print("Press Enter to start", 300, 300)
    else
        -- Draw player 1 (circle)
        love.graphics.setColor(player1.color)
        love.graphics.circle("fill", player1.x, player1.y, player1.radius)

        -- Draw player 2 (rectangle)
        love.graphics.setColor(player2.color)
        love.graphics.rectangle("fill", player2.x, player2.y, player2.width, player2.height)
    end
end