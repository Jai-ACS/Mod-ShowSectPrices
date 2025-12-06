print("this is ShowGridMoreInfoMod")
local ShowGridMoreInfoMod = GameMain:GetMod("ShowGridMoreInfo")

function ShowGridMoreInfoMod:OnInit()

	ShowGridMoreInfoMod.tbFertilityColor = {}
	ShowGridMoreInfoMod.tbFertilityColor[XT("土壤肥沃")] = "#FF9100"
	ShowGridMoreInfoMod.tbFertilityColor[XT("土壤丰饶")] = "#C80001"
	ShowGridMoreInfoMod.tbFertilityColor[XT("土壤良质")] = "#1E90FF"
	ShowGridMoreInfoMod.tbFertilityColor[XT("土壤贫瘠")] = "#00FF00"

	local tbEventMod = GameMain:GetMod("_Event")
	tbEventMod:RegisterEvent(g_emEvent.WindowEvent, self.OnWindowEvent, self)
end

function ShowGridMoreInfoMod:OnRender(_)
	self:ShowGridInfo()
end

function ShowGridMoreInfoMod:ShowGridInfo()
	if CS.UI_WorldLayer.Instance == nil then
		return
	end

	if GridMgr == nil then
		return
	end

	if CS.Wnd_GameMain.Instance.UIInfo == nil then
		return
	end

	if self.bHasResizeTextArea ~= true then
		CS.Wnd_GameMain.Instance.UIInfo.m_n32.UBBEnabled = true
		CS.Wnd_GameMain.Instance.UIInfo.m_n32:SetSize(150, 150)
		self.bHasResizeTextArea = true
	end

	local nCurMouseKey = CS.UI_WorldLayer.Instance.MouseGridKey
	if nCurMouseKey == self.nLastMouseKey and self.bForceUpdate ~= true then
		return
	end
	self.nLastMouseKey = nCurMouseKey
	self.bForceUpdate = nil

	if not GridMgr:KeyVaild(nCurMouseKey) then
		return
	end

	if CS.Wnd_GameMain.Instance.openFengshui then
		local EArray = Map:GetElement(nCurMouseKey)
		local EPArray = Map:GetElementProportion(nCurMouseKey)
		CS.Wnd_GameMain.Instance.UIInfo.m_n32.text = string.format("[color=#FFEB68]金  %05.2f  %02.0f%%[/color]\n[color=#78C84E]木  %05.2f  %02.0f%%[/color]\n[color=#81C1F5]水  %05.2f  %02.0f%%[/color]\n[color=#DA494E]火  %05.2f  %02.0f%%[/color]\n[color=#986B39]土  %05.2f  %02.0f%%[/color]",
				EArray[1], EPArray[1] * 100,
				EArray[2], EPArray[2] * 100,
				EArray[3], EPArray[3] * 100,
				EArray[4], EPArray[4] * 100,
				EArray[5], EPArray[5] * 100)
		return
	end
end

function ShowGridMoreInfoMod:OnWindowEvent(pThing, pObjs)
	local pWnd = pObjs[0]
	local iArg = pObjs[1]
	if pWnd == CS.Wnd_SchoolTrade.Instance and iArg == 1 then
		pWnd.UIInfo.m_itemvalue.visible = true
		pWnd.UIInfo.m_friendpontvalue.visible = true
		pWnd.UIInfo.m_friendpontvalue.y = pWnd.UIInfo.m_itemvalue.y - pWnd.UIInfo.m_friendpontvalue.actualHeight
	end
end
