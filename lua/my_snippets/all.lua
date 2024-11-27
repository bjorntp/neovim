local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
	s("loremh", {
		t({ "Lorem Ipsum", "" }),
	}),
	s("loremr", { -- Trigger is 'log'
		t({ "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit", "" }),
	}),
	s("loremp", {
		t({
			"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut lorem vitae nulla tincidunt interdum id et metus. Proin ornare orci sed massa luctus congue. Vivamus non rhoncus nunc. Aliquam aliquam quis ante vel pulvinar. Donec molestie ante sit amet pulvinar hendrerit. Aliquam velit massa, vestibulum quis nunc in, accumsan placerat neque. Fusce interdum nunc et mauris volutpat ornare. In sapien leo, sodales non orci et, efficitur sagittis ex. Mauris a commodo augue. Maecenas cursus congue mauris, a pharetra mauris aliquet vitae. Proin pharetra enim quis leo fringilla interdum nec quis elit. Sed at tincidunt nisl. Nunc iaculis mi id malesuada porta. Aliquam ut hendrerit ante. Maecenas dictum dictum magna sed sollicitudin. Nunc vesibulum placerat magna, at elementum diam mattis nec. ",
			"",
			"",
		}),
	}),
	s("loremt", {
		t({
			"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ut lorem vitae nulla tincidunt interdum id et metus. Proin ornare orci sed massa luctus congue. Vivamus non rhoncus nunc. Aliquam aliquam quis ante vel pulvinar. Donec molestie ante sit amet pulvinar hendrerit. Aliquam velit massa, vestibulum quis nunc in, accumsan placerat neque. Fusce interdum nunc et mauris volutpat ornare. In sapien leo, sodales non orci et, efficitur sagittis ex. Mauris a commodo augue. Maecenas cursus congue mauris, a pharetra mauris aliquet vitae. Proin pharetra enim quis leo fringilla interdum nec quis elit. Sed at tincidunt nisl. Nunc iaculis mi id malesuada porta. Aliquam ut hendrerit ante. Maecenas dictum dictum magna sed sollicitudin. Nunc vestibulum placerat magna, at elementum diam mattis.",
			"",
			"",
		}),
		t({
			"In ornare sed sem a viverra. Etiam neque ligula, convallis sit amet ligula ut, laoreet efficitur massa. Suspendisse at risus id tellus ullamcorper sodales vitae vitae turpis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed quis dui blandit, porta ligula non, consequat nibh. Phasellus finibus dignissim scelerisque. Sed elementum finibus congue. Duis dictum nisl at sapien rhoncus tincidunt. Donec id viverra diam. Proin varius maximus ex, ac blandit velit congue vitae. Maecenas condimentum nisl ultrices, imperdiet nulla sit amet, laoreet metus. Sed a nibh rutrum, posuere diam sed, fringilla tortor. Sed eu suscipit ligula. Praesent finibus convallis diam. Suspendisse odio turpis, blandit nec mauris ut, egestas pretium lectus. Etiam posuere mollis mauris, vel mattis lectus cursus eleifend.",
			"",
			"",
		}),
		t({
			"Phasellus et commodo velit. Nulla sit amet semper odio, a suscipit est. Praesent tincidunt vulputate leo, a pharetra dui cursus non. Praesent vitae sem in justo egestas eleifend in quis augue. Praesent ac sem ligula. Proin efficitur interdum diam, non lobortis magna feugiat a. Phasellus eu ante faucibus, venenatis lectus nec, scelerisque risus. Phasellus vitae consequat velit. Integer eu urna aliquam, bibendum felis eget, tristique nunc. Sed rutrum eleifend tortor, sed dignissim nisl sagittis in.",
			"",
		}),
	}),
})
