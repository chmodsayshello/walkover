-- register extra flavours of a base 
-- comment by chmodsayshello: didn't change name "on_walk_over", since that would break compability with prior versions
minetest.register_globalstep(function(dtime)
	for _,player in pairs(minetest.get_connected_players()) do
		--local loc = vector.add(player:getpos(),{x=0,y=-1,z=0}) --old implementation
		local loc = vector.offset(player:getpos,0,-0.1,0)
		if loc then
			local nodeiamon = minetest.get_node(loc)
			if nodeiamon then
				local def = minetest.registered_nodes[nodeiamon.name]
				if def and def.on_walk_over then
				def.on_walk_over(loc, nodeiamon, player)
				end
			end   
		end
	end
end)
