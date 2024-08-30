name = "便便桶防亮茄"
author = "Sunrise"
description = [[我们需要亮茄，但是不希望在基地看到亮茄！
对于树苗，有尖刺灌木可以代替
对于浆果丛，浆果已经不再是必需品
对于草，亮茄远离我的基地！

这个mod的功能是使用便便桶施肥的草/浆果丛不会成为亮茄虚影的寄生目标]]

version = "0.1.4"
api_version = 10

--------更新网址
forumthread = ""

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options = {
	{
		name = "grass_uninfectable",
		label = "保护草",
		hover = "便便桶施肥过的草不会被亮茄寄生",
		options = {
			{ description = "on",  data = true, hover = "Default" },
			{ description = "off", data = false },
		},
		default = true,
	},
	{
		name = "berry_uninfectable",
		label = "保护浆果丛",
		hover = "便便桶施肥过的浆果丛不会被亮茄寄生",
		options = {
			{ description = "off", data = false, hover = "Default" },
			{ description = "on",  data = true },
		},
		default = false,
	},
	{
		name = "juicy_uninfectable",
		label = "保护多汁浆果丛",
		hover = "便便桶施肥过的多汁浆果丛不会被亮茄寄生",
		options = {
			{ description = "off", data = false, hover = "Default" },
			{ description = "on",  data = true },
		},
		default = false,
	},
	{
		name = "veggie_uninfectable",
		label = "保护农作物",
		hover = "所有农作物都不会被亮茄寄生",
		options = {
			{ description = "off", data = false, hover = "Default" },
			{ description = "on",  data = true },
		},
		default = false,
	},
	{
		name = "sapling_moon_uninfectable",
		label = "保护月亮树苗",
		hover = "所有月亮树苗都不会被亮茄寄生",
		options = {
			{ description = "off", data = false, hover = "Default" },
			{ description = "on",  data = true },
		},
		default = false,
	},
	{
		name = "let_pass_backpacker",
		label = "放行背包客",
		hover = "装备背包时不会被亮茄主动攻击",
		options = {
			{ description = "off", data = false, hover = "Default" },
			{ description = "on",  data = true },
		},
		default = false,
	},
	{
		name = "let_pass_equipment",
		label = "安全通行装备",
		hover = "装备安全通行装备时第一次不会被亮茄主动攻击",
		options = {
			{ description = "off", data = false, hover = "Default" },
			{ description = "指南针", data = "compassbearer" },
			{ description = "蘑菇帽", data = "spoiler" },
			{ description = "海盗头巾", data = "master_crewman" },
			{ description = "星象护目镜", data = "wagstaff_detector" },
			{ description = "others", data = "lunarprayer", hover = "风幻龙的护身符(放入纯粹辉煌)等给角色添加lunarprayer标签的mod装备" },
		},
		default = false,
	},
}
