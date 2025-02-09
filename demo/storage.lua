function store_init()
	storage={
		units=1,		
		flag=false,
		isFull=false,
		flag=false,
	}

	storage.units = 1
	store_t = storage.units * 10
	storage.flag = false
	storage.cost = 10
end

function store_update()
	
	store_t = storage.units * 10
	
	if (mana.quantity>=store_t) then
		storage.isFull = true 
	else
		storage.isFull = false
	end
	
	if stat(34)==1 and not storage.flag then
		if ((stat(32)>=64) and (stat(32)<=128)) then
			if ((stat(33)>=64) and (stat(33)<=128)) then
				if(mana.quantity >= storage.cost) then
					mana.quantity-=10
					storage.units+=1
					storage.flag=true
					storage.cost+=1
		 	end
		 end
		end
 end
 
 if stat(34)==0 then
		storage.flag=false	
	end
	
end

function store_draw()
	print("store: "..mana.quantity.."/"..store_t,66,66)
	print("store q: "..storage.units) 
	print("store cost :"..storage.cost)
end	