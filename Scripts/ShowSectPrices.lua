local Mod = GameMain:GetMod("Jai_ShowSectPrices")

function Mod:OnInit()
	local tbEventMod = GameMain:GetMod("_Event")
	tbEventMod:RegisterEvent(g_emEvent.WindowEvent, self.OnWindowEvent, self)
	xlua.private_accessible(CS.Wnd_SchoolTrade)
end

-- function ShowGridMoreInfoMod:OnRender(_)
-- 	self:ShowGridInfo()
-- end

function Mod:OnWindowEvent(pThing, pObjs)
	local pWnd = pObjs[0]
	local iArg = pObjs[1]
	if pWnd == CS.Wnd_SchoolTrade.Instance and iArg == 1 then
		-- pWnd.UIInfo.m_itemvalue.visible = true
		-- pWnd.UIInfo.m_friendpontvalue.visible = true
		-- pWnd.UIInfo.m_friendpontvalue.y = pWnd.UIInfo.m_itemvalue.y - pWnd.UIInfo.m_friendpontvalue.actualHeight

		self:showPrices(pWnd.UIInfo)
		pWnd.UIInfo.m_n51.onClickItem:Add(
			function()
				self:showPrices(pWnd.UIInfo)
			end
		)
	end
end

function Mod:showPrices(uiInfo)
	uiInfo.m_itemvalue.visible = true
	uiInfo.m_friendpontvalue.visible = true
	uiInfo.m_friendpontvalue.y = uiInfo.m_itemvalue.y - uiInfo.m_friendpontvalue.actualHeight
end
