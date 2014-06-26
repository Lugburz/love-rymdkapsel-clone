export ^

require "world/spacebase"
require "spacebaseview"
require "ui/ui"

class Game
    new: =>
        @spacebase = Spacebase()
        @view = SpacebaseView(@spacebase)
        @ui = UI(@spacebase)
        @minions = {}

    update: (dt) =>
        @view\update(dt)
        @spacebase.mousePosition = @view\coordinatesInWorld(love.mouse.getX(), love.mouse.getY())
        @spacebase\update(dt)

    draw: =>
        @view\draw()
        love.graphics.origin()
        @ui\draw()

    keyreleased: (key) =>
        switch(key)
            when "p"
                @view\keyreleased(key)
            when "escape"
                love.event.quit()

    mousepressed: (x, y, button) =>
        @ui\mousepressed(x, y, button)
