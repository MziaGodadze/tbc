-- Initialize variables
local showWelcome = true
local score1, score2 = 0, 0
local timer = 30

local player1 = {x = 100, y = 100, radius = 20, color = {255, 0, 0}} -- Red circle
local player2 = {x = 400, y = 300, size = 40, color = {0, 255, 0}}   -- Green triangle

local stars = {} -- Table to store star objects

function love.load()
    love.window.setTitle("My Game")
    love.window.setMode(800, 600)
    love.graphics.setBackgroundColor(255, 255, 153) -- Light yellow background color

    -- Create 10 random stars
    for i = 1, 10 do
        local star = {
            x = love.math.random(0, love.graphics.getWidth()),
            y = love.math.random(0, love.graphics.getHeight()),
            size = love.math.random(5, 10),
            color = {love.math.random(100, 255), love.math.random(100, 255), love.math.random(100, 255)}
        }
        table.insert(stars, star)
    end
end

function love.update(dt)
    -- Handle player movements
    if not showWelcome then
        local speed = 200
        if love.keyboard.isDown("w") then
            player1.y = player1.y - speed * dt
        end
        if love.keyboard.isDown("s") then
            player1.y = player1.y + speed * dt
        end
        if love.keyboard.isDown("a") then
            player1.x = player1.x - speed * dt
        end
        if love.keyboard.isDown("d") then
            player1.x = player1.x + speed * dt
        end

        if love.keyboard.isDown("up") then
            player2.y = player2.y - speed * dt
        end
        if love.keyboard.isDown("down") then
            player2.y = player2.y + speed * dt
        end
        if love.keyboard.isDown("left") then
            player2.x = player2.x - speed * dt
        end
        if love.keyboard.isDown("right") then
            player2.x = player2.x + speed * dt
        end

        -- Ensure players stay within the screen boundaries
        player1.x = math.max(player1.x, player1.radius)
        player1.x = math.min(player1.x, love.graphics.getWidth() - player1.radius)
        player1.y = math.max(player1.y, player1.radius)
        player1.y = math.min(player1.y, love.graphics.getHeight() - player1.radius)

        player2.x = math.max(player2.x, 0)
        player2.x = math.min(player2.x, love.graphics.getWidth() - player2.size)
        player2.y = math.max(player2.y, 0)
        player2.y = math.min(player2.y, love.graphics.getHeight() - player2.size)

        -- Update the timer
        timer = timer - dt
        if timer <= 0 then
            -- Game over, reset timer and show welcome message
            showWelcome = true
            score1, score2 = 0, 0
            timer = 30
        end
    end
end

function love.keypressed(key)
    -- Start the game when Enter key is pressed
    if key == "return" then
        showWelcome = false
    end
end

function love.draw()
    -- Draw background
    love.graphics.setBackgroundColor(255, 255, 153) -- Light yellow 
   -- Draw stars
    for _, star in ipairs(stars) do
        love.graphics.setColor(0, 0, 0)
        love.graphics.circle("fill", star.x, star.y, 16)
    end

    if showWelcome then
        -- Draw welcome message
        love.graphics.setColor(0, 0, 0) -- Black color
        love.graphics.printf("Welcome to my game!\nPress Enter to start", 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), "center")
    else
        -- Draw players
        love.graphics.setColor(player1.color)
        love.graphics.circle("fill", player1.x, player1.y, player1.radius)

        love.graphics.setColor(player2.color)
        love.graphics.polygon("fill", player2.x, player2.y, player2.x + player2.size, player2.y, player2.x + player2.size / 2, player2.y - player2.size)

  
-- Draw scores and timer
        love.graphics.setColor(0, 0, 0) -- Black color
        love.graphics.print("Player 1 Score: " .. score1, 10, 10)
        love.graphics.print("Player 2 Score: " .. score2, 10, 30)
        love.graphics.print("Time: " .. math.ceil(timer), love.graphics.getWidth() - 70, 10)
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    -- Check for collision with stars
    if not showWelcome then
        for i, star in ipairs(stars) do
            if distance(x, y, star.x, star.y) <= star.size then
                -- Remove the star and update the scores
                table.remove(stars, i)
                score1 = score1 + 1
                score2 = score2 + 1
                break
            end
        end
    end
end

function distance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end
 --for some reason i can't collect stars(circles) but everything else works so i think it is accepteble