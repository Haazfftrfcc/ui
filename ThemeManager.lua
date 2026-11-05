-- ThemeManager.lua
local ThemeManager = {}
local Library = nil

function ThemeManager:SetLibrary(lib)
    Library = lib
end

function ThemeManager:ApplyToTab(Tab)
    -- 테마 설정 관련 UI를 탭에 구성하는 자리입니다.
    -- 모바일 버전 간소화를 위해 기본 틀만 유지합니다.
end

function ThemeManager:SetFolder(folder)
    -- 폴더 설정 기능
end

function ThemeManager:IgnoreThemeSettings()
    -- 무시할 설정 인덱스 설정
end

return ThemeManager
