local Mod = GameMain:GetMod("Jai_ShowSectPrices")

function Mod:OnInit()
	local tbEventMod = GameMain:GetMod("_Event")
	tbEventMod:RegisterEvent(g_emEvent.WindowEvent, self.OnWindowEvent, self)
end

function Mod:OnWindowEvent(pThing, pObjs)
	local pWnd = pObjs[0]
	local iArg = pObjs[1]
	if pWnd == CS.Wnd_SchoolTrade.Instance and iArg == 1 then
		if pWnd.UIInfo ~= nil then
			self:showPrices(pWnd.UIInfo)
			pWnd.UIInfo.m_n64.m_n63.onClickItem:Add(
				function()
					self:showPrices(pWnd.UIInfo)
				end
			)
		end
	end
end

function Mod:showPrices(uiInfo)
	if uiInfo ~= nil then
		uiInfo.m_itemvalue.visible = true
		uiInfo.m_friendpontvalue.visible = true
		uiInfo.m_friendpontvalue.y = uiInfo.m_itemvalue.y - uiInfo.m_friendpontvalue.actualHeight
	end
end
