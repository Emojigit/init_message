local join_player_wellcome = minetest.settings:get("wellcome_message") or "Wellcome %s, have fun!"
local new_player_boardcast = minetest.settings:get("new_player_boardcast") or "%s joined this game for the first time, wellcome!"
local new_player_wellcome = minetest.settings:get("new_player_message") or "Wellcome %s! have fun!\nRules: https://toyshost2.ddns.net/city-rules\nOur website: https://toyshost2.ddns.net/mts"

-- minetest.chat_send_player(name, text)

minetest.register_on_joinplayer(function(ObjectRef, last_login)
	if not ObjectRef:is_player() then return end
	minetest.after(0.5, function(player)
		local name = player:get_player_name()
		minetest.chat_send_player(name, string.format(join_player_wellcome, name))
		minetest.log("action", "[init_message] Sent wellcome message to "..name.."with text "..string.format(join_player_wellcome, name))
	end, ObjectRef)
	if not(last_login) then
		minetest.after(0.5, function(player)
			local name = player:get_player_name()
			minetest.chat_send_player(name, string.format(new_player_wellcome, name))
			minetest.log("action", "[init_message] Sent wellcome message to "..name.."with text "..string.format(new_player_wellcome, name))
		end, ObjectRef)
		minetest.after(0.5, function(player)
			local name = player:get_player_name()
			minetest.chat_send_all(string.format(new_player_boardcast, name))
			minetest.log("action", "[init_message] Sent wellcome message to everybody with text "..string.format(new_player_boardcast, name))
		end, ObjectRef)
	end
end)

minetest.log("action","[init_message] Loaded")
