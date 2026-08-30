local addonName, addon = ...
---@type MiniFramework
local mini = addon.Framework

local MACRO_TEXT = table.concat({
	"/click TotemFrameTotem1 RightButton 1",
	"/click TotemFrameTotem2 RightButton 1",
	"/click TotemFrameTotem3 RightButton 1",
	"/click TotemFrameTotem4 RightButton 1",
}, "\n")

mini:WaitForAddonLoad(function()
	-- A styled button clashes with the stock Blizzard art around it in the settings screen.
	mini:SetCustomStyling(true, { Button = false })

	local panel = CreateFrame("Frame")
	panel.name = addonName

	local category = mini:AddCategory(panel)

	if not category then
		return
	end

	-- No saved settings exist yet, so the panel is the title, the description, and the rule.
	local header = mini:PanelHeader({
		Parent = panel,
		Description = "Creates four buttons for use in macros to cancel your active totems.",
		Divider = true,
	})

	local caption = mini:TextBlock({
		Parent = panel,
		Lines = { "Paste this into a macro, then click it to destroy your active totems." },
	})
	caption:SetPoint("TOPLEFT", header.Divider, "BOTTOMLEFT", 0, -mini.VerticalSpacing)

	local macros = mini:EditBox({
		Parent = panel,
		Readonly = true,
		MultiLine = true,
		Width = 400,
		Height = 70,
		GetValue = function()
			return MACRO_TEXT
		end,
	})
	macros.EditBox:SetPoint("TOPLEFT", caption, "BOTTOMLEFT", 0, -mini.VerticalSpacing)

	mini:RegisterSlashCommand(category, panel, {
		"/minitotemcancel",
		"/minitc",
		"/mtc",
	})
end)
