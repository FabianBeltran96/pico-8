function action_init()
	action_state="enable" -- enable or disable
	action_time=30
	action_clock=0
end

function action_update()
	if(action_state=="disable")then
		action_clock+=1
	end
	if(action_clock==30)then
		action_clock=0
		action_state="enable"
	end
end

function action_draw()
 if action_state=="enable" then
		rect(0,0,127,127,11)
	else
		rect(0,0,127,127,5)	
	end
end