name = "便便桶防亮茄"
author = "Sunrise"
description = [[我们需要亮茄，但是不希望在基地看到亮茄！
对于树苗，有尖刺灌木可以代替
对于浆果丛，浆果已经不再是必需品
对于草，亮茄远离我的基地！

这个mod的功能是使用便便桶施肥的草/浆果丛不会成为亮茄虚影的寄生目标]]

version = "0.1.3"
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
}
