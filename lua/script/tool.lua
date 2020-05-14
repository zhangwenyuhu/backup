
local tool = {};

function tool:printLog(txtLog)
	print("call tool printLog begin")
	print(txtLog)
end

function tool:TimeNow()                              --记录点时间信息什么的
    tool.Year  = os.date("%Y");                      --年
    tool.Month = os.date("%m");                      --月
    tool.Day   = os.date("%d");                      --日
    tool.Hour  = os.date("%H");                      --时
    tool.Min   = os.date("%M");                      --分
    tool.Sec   = os.date("%S");                      --秒
    tool.Week  = os.date("%w");                      --周（0-6，周日-周六）
end

return tool;
