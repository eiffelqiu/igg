module Igg
	module Conf
		const_set(:PROMPT1, "Igg Server #{@version}                   Eiffel Q(eiffelqiu@qq.com)")
		const_set(:PROMPT2, "Server automatically modified lib/weltmeister/config.js file and removed all '.php' suffix in API of this file")
		const_set(:PROMPT3, "Play your game  : http://localhost:4567/")
		const_set(:PROMPT4, "Run weltmeister : http://localhost:4567/weltmeister")
		const_set(:PROMPT5, "Igg source code : https://github.com/eiffelqiu/igg")
		const_set(:MAXSIZE, [PROMPT1.size,PROMPT2.size,PROMPT3.size,PROMPT4.size,PROMPT5.size].max)
	end
end