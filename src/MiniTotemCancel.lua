for i = 1, 4 do
	local name = "TotemFrameTotem" .. i

	if not _G[name] then
		local frame = CreateFrame("Button", name, UIParent, "SecureActionButtonTemplate")
		frame:SetAttribute("type", "destroytotem")
		frame:SetAttribute("totem-slot", i)
	end
end
