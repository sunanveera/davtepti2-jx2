
-- ====================== 文件信息 ======================

-- 剑侠情缘onlineII 教育任务头文件
-- Edited by peres
-- 2005/05/07 PM 19:55

-- 粘稠新鲜的血，从她的身体深处流淌出来。
-- 缓缓的，温暖的，把她浸润在潮湿的床单上。
-- 她觉得疼痛。
-- 她感觉到自己在盛放和枯萎之中，一片又一片的花瓣，就这样掉落下来……黑暗的潮水涌动上来。
-- 去往世界尽头的路途。
-- 童年的海岛在遥远的地方，夜色中的航船，漂泊在无际的大海中。

-- ======================================================


TEACH_SEASONNPC_ID = 1  -- 野叟新手任务的任务变量记录


-- 子函数，用以获取教育任务的进展程度
function TE_GetTeachState()
	return GetTask(TEACH_SEASONNPC_ID)
end

-- 子函数，用以设置教育任务的进展程度
function TE_SetTeachState(nValue)
	SetTask(TEACH_SEASONNPC_ID, nValue)
end

-- 子函数，得到教育任务的状态
function TE_GetTeachPro()
	return GetTask(TEACH_STATE_ID)
end

-- 子函数，设置教育任务的状态
function TE_SetTeachPro(nValue)
	SetTask(TEACH_STATE_ID,nValue)
end


-- 子函数，使教育任务进展到下一步
function TE_SetTeachAdd()
	SetTask(TEACH_SEASONNPC_ID, GetTask(TEACH_SEASONNPC_ID) + 1)
	return
end


-- 用于处理一堆选项的对话函数 Say(""...);
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
	end;
	
	dostring(strMsg);
	
end;


-- 子函数，用于扩展对话 TALK 函数的功能
function TE_Talk(fun,szMsg)
	local num = getn(szMsg)
	local szmsg = ""
	for i=1,num-1 do
		szmsg = szmsg..format("%q",szMsg[i])..","
	end
	szmsg = szmsg .. format("%q",szMsg[num])
	szmsg = "Talk("..num..","..format("%q",fun)..","..szmsg..")"
	dostring(szmsg)
end	

-- 子函数，用以获取玩家的性别，直接返回字符串
function GetPlayerSex()

local mySex -- 用以显示人物性别的字符

	if (GetSex() == 1) then
		mySex = "Young man"
	elseif (GetSex() == 2) then
		mySex = "Young lady"
	end
	
	return mySex
	
end