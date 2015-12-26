------------------------------------------------------------------------------------------------
--	PlayfairPlots ver. @project-version@
--	by Chrono Syz--Entity-US
--	Build @project-hash@
--	Copyright (c) Chronosis. All rights reserved
--
--	https://github.com/NexusInstruments/PlayfairPlots
------------------------------------------------------------------------------------------------
--  PlayfairPlots.lua
--	PlayfairPlots - WildstarLUA Data Plotting Library
------------------------------------------------------------------------------------------------
require "Apollo"

local PackageName, Major, Minor, Patch = "PlayfairPlots", 1, 0, 0
local PkgMajor, PkgMinor = PackageName, tonumber(string.format("%02d%02d%02d", Major, Minor, Patch))
local Pkg = Apollo.GetPackage(PkgMajor)
if Pkg and (Pkg.nVersion or 0) >= PkgMinor then
  return -- no upgrade needed
end

-- Libraries
local Seurat = {}

-- Set a reference to the actual package or create an empty table
local PlayfairPlots = Pkg and Pkg.tPackage or {}
local Plot = {}

-----------------------------------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------------------------------
PlayfairPlots.tPlotTypes = {
  ["Line"] = 1,
  ["Bar"] = 2,
  ["StackedBar"] = 3,
  ["Pie"] = 4,
  ["Ring"] = 5
}

PlayfairPlots.tPlotTypeNames = {
  [1] = "Line",
  [2] = "Bar",
  [3] = "StackedBar",
  [4] = "Pie",
  [5] = "Ring"
}

PlayfairPlots.tLegendStyle = {
  ["Horizontal"] = 1,
  ["Vertical"] = 2
}

PlayfairPlots.tGridLineStyle = {
  ["Solid"] = 0,
  ["Dotted"] = 1,
  ["SmallDash"] = 2,
  ["LongDash"] = 3
}
-----------------------------------------------------------------------------------------------
-- Defaults
-----------------------------------------------------------------------------------------------
local tDefaultState = {
  canvas = nil,
  location = {
    left = nil,
    top = nil,
    right = nil,
    bottom = nil
  },
  margins = {
    left = nil,
    top = nil,
    right = nil,
    bottom = nil
  },
  type = PlayfairPlots.tPlotTypes["Line"],
  labels = {},
  colors = {},
  datasets = {
    [0] = {}
  },
  border = {
    include = false,
    width = 0,
    color = "FFFFFFFF"
  },
  legend = {
    include = false,
    location = {
      left = nil,
      top = nil,
      right = nil,
      bottom = nil
    },
    border = {
      include = false,
      width = 1,
      color = "FFFFFFFF"
    },
    style = PlayfairPlots.tLegendStyle["Vertical"]
  },
  gridlines = {
    include = false,
    spacing = 30,
    style = PlayfairPlots.tGridLineStyle["Solid"],
    color = "FF4f4f4f"
  },
  axis = {
    color = "FFFFFFFF",
    font = "",
    x = {
      include = false,
      label = "",
      drawLabel = true,
      drawValues = true,
      range = {
        start = 0,
        finish = 300
      },
      divisions = 30,
      subdivisions = 10,
    },
    y = {
      include = false,
      label = "",
      drawLabel = true,
      drawValues = true,
      range = {
        start = 0,
        finish = 300
      },
      divisions = 30,
      subdivisions = 10,
    }
  }
}

------------------------------------------------------------------------------------------------
--  PlayfairPlots Functionality
------------------------------------------------------------------------------------------------
-- Copy Constructor
function PlayfairPlots:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  return o
end

function PlayfairPlots:Init(canvasWnd, scale, quiet)
  self.state = deepcopy(tDefaultState)
  self.state.canvas = Seurat:CreateCanvas("PlayFairPlot", canvasWnd, scale, quiet)
end

------------------------------------------------------------------------------------------------
--  Plot Functionality
------------------------------------------------------------------------------------------------
-- Copy Constructor
function Plot:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self

  return o
end

-- Initialize
function Plot:Init(canvasWnd, scale, quietMode)
end

Apollo.RegisterPackage(PlayfairPlots, PkgMajor, PkgMinor, {"SimpleUtils", "Seurat"})
Seurat = Apollo.GetPackage("Seurat").tPackage
