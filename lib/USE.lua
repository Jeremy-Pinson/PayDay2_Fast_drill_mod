--[[
Jérémy (Polunga) Pinson
PayDay2 faster drill mod
]]--

if managers.player and managers.player:local_player() and alive(managers.player:local_player()) then
	managers.player:__enable_fast_drill()
end