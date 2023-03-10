-- project Engine
project "SGBM"
    -- 项目类型：控制台程序
	kind "ConsoleApp"

    -- 语言：C++
	language "C++"

    -- 
	cppdialect "C++17"

    -- 
	staticruntime "on"

    -- 指定输出目录
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")

    -- 指定中间目录
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    -- 
	pchheader "pch.h"

    -- 
	pchsource "src/pch.cpp"
  
	files
	{
    -- 加载src目录下的所有.h,.cpp文件
		"src/**.h",
		"src/**.cpp",
	}

    -- 
	includedirs
	{
        -- 
		"src",
	}

	-- links{

	-- }
  
    -- 
	flags { "NoPCH" }

    -- 当当前系统是windows时
	filter "system:windows"
		systemversion "latest"

		defines
		{
			SGBM_PLATFORM_WINDOWS,
		}

    -- Debug配置项属性
	filter "configurations:Debug"
        -- 定义SGBM_DEBUG宏 
		defines "SGBM_DEBUG"
		runtime "Debug"
        -- 开启调试符号
		symbols "on"

    -- Release配置项属性
	filter "configurations:Release"
        -- 定义SGBM_RELEASE宏
		defines "SGBM_RELEASE"
		runtime "Release"
        -- 开启优化参数
		optimize "on"