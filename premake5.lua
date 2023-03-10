--workspace 解决方案
workspace "SGBM"

  -- 启动项目
  startproject "SGBM"

  -- 解决方案配置项：Debug、Release
	configurations
	{
		"Debug",
		"Release",
	}

  -- 平台配置
  platforms
  {
    'x64'
  }

  -- x64平台配置属性
  filter "platforms:x64"
    -- 指定架构为x64
    architecture "x64"

  -- 指定输出目录和中间目录的文件夹名称
  outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"