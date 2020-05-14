local FunHelper = {}

function FunHelper.test( )
    FunHelper.timeExp()
    FunHelper.loopExp()
end

function FunHelper.mathExp( ... )
    -- pi
    print("pi is "..tostring(math.pi))

    -- random
    local l_a,l_b = 1,100
    math.randomseed(os.time())
    print(math.random(l_a,l_b))
    print(math.random(l_b))

    -- 取整
    print(math.floor(1.55)) --向下
    print(math.ceil(1.58))  --向上

    -- 求余
    print(math.fmod(16,3))

    -- 开平方
    print(math.sqrt(25))

    -- x的y次方
    local x,y = 2,6
    print(math.pow(x,y))

    -- 分离整数和小数部分
    x,y = math.modf(16.35462)
    print("before point is "..tostring(x))
    print("after point is "..tostring(y))

    -- max min
    x = math.max(10,45,96,85,100)
    y = math.min(65,22,58,5)
    print("max is "..tostring(x))
    print("min is "..tostring(y))

    local l_tb_num = {95,100,123,158,2,65,48,87,62}
    x = math.max( unpack(l_tb_num) )
    y = math.min( unpack(l_tb_num) )
    print("max is "..tostring(x))
    print("min is "..tostring(y))

    -- abs
    print(math.abs(-500))
    print(math.abs(200))

    -- 弧度转角度
    math.deg(math.pi)   -- 180

    -- 角度转弧度
    math.rad(180)   -- pi 3.1415926
end

function FunHelper.timeExp( ... )
    print("timeExp begin")
    --timeGMT
    local timeGMT = tonumber(os.date("%z", 0))/100
    print("local timeGMT is "..tostring(timeGMT))

    local function strToTimeStamp( str )
        -- "2018-08-20 11:30:30"  to 1534735830
        local year, month, day, hour, min, sec = str:match("(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
        return os.time({year = year, month = month, day = day, hour = hour, min = min, sec = sec})
    end

    local function timeStampToStr( timeStamp )
        -- 1534735830 to "2018-08-20 11:30:30"
        return os.date("%Y-%m-%d %H:%M:%S",timeStamp)
    end

    --timestamp
    local l_nowStamp = os.time()
    local l_selectStamp = os.time({year = 2018, month = 8, day = 20, hour = 11, min = 30, sec = 30})
    print("select timeStamp : 2018-08-20 11:30:30")
    print(l_selectStamp)
    print("now timeStamp :")
    print(l_nowStamp)

    local l_between = math.abs(l_nowStamp-l_selectStamp)
    local l_sec = math.fmod(l_between,60)
    local l_min = math.floor(math.fmod(l_between,3600)/60)
    local l_hour = math.fmod(math.floor(l_between/3600),24)
    local l_day = math.floor(l_between/(3600*24))
    print(string.format("between time is %d days %d hours %d mins %d sec!!!",l_day,l_hour,l_min,l_sec))

    --date
    --: os.date ([format [, time]])
    --: 返回一个按format格式化日期、时间的字串或表
    local l_now = os.date()
    local l_select = os.date("%Y-%m-%d %H:%M:%S",l_selectStamp)
    local l_select2 = os.date("*t",l_selectStamp)
    local l_select3 = os.date("!*t",l_selectStamp)
    local l_dateTime = os.date("%c",l_selectStamp)
    print("select time :")
    print(l_select)         --2018-08-20 11:30:30
    print(l_select2)
    --[[
    +sec [30]
    +min [30]
    +day [20]
    +isdst [false]
    +wday [2]
    +yday [232]
    +year [2018]
    +month [8]
    +hour [11]
    --]]
    print(l_select3)
    --[[
    +sec [30]
    +min [30]
    +day [20]
    +isdst [false]
    +wday [2]
    +yday [232]
    +year [2018]
    +month [8]
    +hour [3]
    --]]
    print(l_dateTime)       --Mon Aug 20 11:30:30 2018

    print("now time :")
    print(l_now)            --Tue Aug 21 16:07:43 2018

    print("timeExp end")
end

function FunHelper.loopExp( ... )
    -- for loop
    print("loop 1")
    for i=1,10 do
        print(i)
    end
    print("loop 2")
    for i=1,10,2 do
        print(i)
    end
    print("loop 3")
    for i=10,1,-1 do
        print(i)
    end
    print("loop 4")
    for i=10,1,-2 do
        print(i)
    end

    local l_tb_num = {5,6,8,22}
    print("loop 5")
    for i,v in ipairs(l_tb_num) do
        print(v)
    end
    print("loop 6")
    for k,v in pairs(l_tb_num) do
        print(v)
    end

    -- 迭代器
    print("loop 7")
    local function funcExp( tb )
        local i = 0
        return function ( ... )
            i = i+1
            return tb[i]
        end
    end

    local l_it = funcExp(l_tb_num)
    while 1 do
        local l_value = l_it()
        if not l_value then
            break
        end
        print(l_value)
    end

    -- 迭代器+泛型for
    print("loop 8")
    for v in funcExp(l_tb_num) do
        print(v)
    end
end

function FunHelper.tableExp( ... )
    local l_tb_num = {}
    local function tbInit( ... )
        l_tb_num = {9,5,1,7,3,4,6,85,96,43,51,68,95,522}
    end
    tbInit()
    print("test table : 1")
    print(l_tb_num)

    -- sort
    table.sort(l_tb_num,function ( p1,p2 )
        return p1>p2
    end)
    print("test table : 2")
    print(l_tb_num)

    -- remove
    tbInit()
    for i=#l_tb_num,1,-1 do
        if math.fmod(l_tb_num[i],2)==0 then
            table.remove(l_tb_num,i)
        end
    end
    print("test table : 3")
    print(l_tb_num)
end

return FunHelper
