
-- cclog
cclog = function(...)
    print(string.format(...))
end

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
end

local function MainInit()
	
	print("20170222 MainInit called")
    --package.loaded['script/UI.lua'] = nil;
	--require('script/UI');
	local function MainUpdate()
		print("20170222 MainUpdate called")
	end
	
	MainUpdate()
	
	--dofile require 
	local toolOne = dofile('script/tool.lua')
	toolOne:printLog("call tool printLog")
	
	-- call c++
	local lRandom = CRandom:new()
	lRandom:Random_Seed(666)
	local nIndex = lRandom:Random_Int(1,9)
	print(nIndex)
end

xpcall(MainInit, __G__TRACKBACK__)

