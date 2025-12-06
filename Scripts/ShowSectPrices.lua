local Mod = GameMain:GetMod("Jai_ShowSectPrices")

function Mod:OnInit()
	local tbEventMod = GameMain:GetMod("_Event")
	tbEventMod:RegisterEvent(g_emEvent.WindowEvent, self.OnWindowEvent, self)
end

-- function ShowGridMoreInfoMod:OnRender(_)
-- 	self:ShowGridInfo()
-- end

function Mod:OnWindowEvent(pThing, pObjs)
	local pWnd = pObjs[0]
	local iArg = pObjs[1]
	if pWnd == CS.Wnd_SchoolTrade.Instance and iArg == 1 then
		print("showing")
		pWnd.UIInfo.m_itemvalue.visible = true
		pWnd.UIInfo.m_friendpontvalue.visible = true
		pWnd.UIInfo.m_friendpontvalue.y = pWnd.UIInfo.m_itemvalue.y - pWnd.UIInfo.m_friendpontvalue.actualHeight
	end
end

