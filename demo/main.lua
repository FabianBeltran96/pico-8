function _init()
	poke(0x5f2d, 1)
	action_init()
	mana:init()
	building:init()
	storage:init()

	clock = 0
	secs = 0
	start_flag = false
end

function _update()
	mana:update()
	building:update()
	storage:update()
	action_update()

	if start_flag then
		if (clock >= 30) then
			secs += 1
			clock = 0
		end
	end

	clock += 1

	if (mana.quantity >= 100) then
		start_flag = false
	end
end

function _draw()
	cls()
	map()
	print("segundos: " .. secs, 64, 2)

	mana:draw()
	building:draw()
	storage:draw()
	action_draw()
	-- printh("test", "log")
	print(stat(32) .. "/" .. stat(33), stat(32), stat(33))
	circfill(stat(32), stat(33), 1, 6)
end