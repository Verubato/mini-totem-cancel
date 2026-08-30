-- Loads the whole addon into a mocked client and drives it through login.
-- The shared body lives in build/Lua/SmokeTest.lua.

local fw = require("TestFramework")
local smoke = require("SmokeTest")
local WowMock = require("WowMock")

---The header's subtitle and the macro edit box are both built by the framework and never
---handed back to the addon, so a test finds them the way a player reads them, by their words.
---An edit box is itself a frame rather than a region of one, so both are checked.
---@param text string
---@return boolean
local function HasText(text)
	for _, frame in ipairs(WowMock.Frames) do
		if frame.GetText and frame:GetText() == text then
			return true
		end

		for _, region in ipairs({ frame:GetRegions() }) do
			if region.GetText and region:GetText() == text then
				return true
			end
		end
	end

	return false
end

---The section rule is built by the framework and never handed back to the addon, so a test
---finds it the way a player sees it, by its label.
---@param text string
---@return boolean
local function HasDivider(text)
	for _, frame in ipairs(WowMock.Frames) do
		if frame.Label and frame.Label.GetText and frame.Label:GetText() == text then
			return true
		end
	end

	return false
end

smoke.Run("MiniTotemCancel", {
	extra = function(context)
		fw.eq(context.Addon.Framework.CustomStyling, true, "custom styling on")
		fw.eq(context.Addon.Framework.CustomStylingOverrides.Button, false, "stock buttons")
		fw.truthy(HasText("Creates four buttons for use in macros to cancel your active totems."), "the subtitle under the panel title")
		fw.falsy(HasDivider("SETTINGS"), "no settings rule over a panel with nothing to set")
		fw.truthy(HasDivider("INFO"), "the Info section rule under the header")
		fw.truthy(
			HasText(table.concat({
				"/click TotemFrameTotem1 RightButton 1",
				"/click TotemFrameTotem2 RightButton 1",
				"/click TotemFrameTotem3 RightButton 1",
				"/click TotemFrameTotem4 RightButton 1",
			}, "\n")),
			"the macro lines in the edit box"
		)
	end,
})
