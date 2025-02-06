pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()
	mana_init()
	building_init()
	store_init()
	clock= 0 
	secs = 0
 start_flag=false
end

function _update()
	mana_update()
	building_update()
	store_update()
	
	if(start_flag)then
		if(clock>=30)then
			secs+=1
			clock=0
		end
	end
	
	clock+=1
	
	if(mana>=1000)then
		start_flag=false
	end	

end

function _draw()
	cls()
	mana_draw()
	building_draw()
	store_draw()
	print("segundos: "..secs)
end
-->8
function mana_init()
	mana=0
	mana_flag=false
end

function mana_update()
	
	if(store_f) then
	 return
	end

	if(btn(2) and not mana_flag )then
		mana+=1
		mana_flag=true
		start_flag=true
 end

	if (not btn(2)) then
		mana_flag=false	
	end

end

function mana_draw()
	cls()
	print("mana: "..mana)
end
-->8
function building_init()
	building=0
	building_flag=false
	building_time=0
	building_cost=10
end

function building_update()

	if(btn(5) and not building_flag )then
		
		if(mana >= building_cost) then
			building+=1
			building_flag=true
			building_cost+=1
			mana-=10
 	end
 
 end

	if (not btn(5)) then
		building_flag=false	
	end
	
	if (mana >= store_t) then
		mana=store_t
		return
	end
	
	if (building > 0 and building_time==0) then
		mana+=1*building
	end
	
	if (building_time == 15) then
		building_time=0
	else
		building_time+=1
	end
	
end

function building_draw()
	print("buildings: "..building)
	print("building cost: "..building_cost)
end


-->8
function store_init()
	store_q = 1
	store_t = store_q * 10
	store_f = false --is store full?
	store_flag = false
	store_cost = 10
end

function store_update()
	
	store_t = store_q * 10
	
	if (mana>=store_t) then
		store_f = true 
	else
		store_f = false
	end
	
	if(btn(4) and not store_flag )then
		
		if(mana >= store_cost) then
			mana-=10
			store_q+=1
			store_flag=true
			store_cost+=1
 	end

 end
 
 if (not btn(4)) then
		store_flag=false	
	end
	
end

function store_draw()
	print("store: "..mana.."/"..store_t)
	print("store q: "..store_q) 
	print("store cost :"..store_cost)
end	

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
