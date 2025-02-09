mouse = {
    x = 0,
    y = 0,
    button = 0,
    init = function(self)
        poke(0x5f2d, 1)
    end,
    update = function(self)
        self.x = stat(32)
        self.y = stat(33)
        self.button = stat(34)
    end,
    draw = function(self)
        circfill(self.x, self.y, 1, 6)
    end
}