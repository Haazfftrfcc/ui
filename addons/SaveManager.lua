-- SaveManager.lua
local SaveManager = {}
local Library = nil

function SaveManager:SetLibrary(lib)
    Library = lib
end

function SaveManager:SetFolder(folder)
    -- 저장 폴더 지정
end

function SaveManager:IgnoreThemeSettings()
    -- 테마 세팅 제외
end

function SaveManager:SetIgnoreIndexes(indexes)
    -- 무시할 항목 지정
end

function SaveManager:BuildConfigSection(Tab)
    -- 설정 관련 UI 빌드 영역
end

function SaveManager:LoadAutoloadConfig()
    -- 자동 설정 로드
end

return SaveManager
