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

-- Set a reference to the actual package or create an empty table
local PlayfairPlots = Pkg and Pkg.tPackage or {}

Apollo.RegisterPackage(PlayfairPlots, PkgMajor, PkgMinor, {"SimpleUtils", "Seurat"})
