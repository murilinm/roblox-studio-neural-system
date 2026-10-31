--[[
textNetwork.lua

transforma a string vstr na string tstr por meio de cálculos de vetores
transforms string vstr to string tstr by vector calculations

caso queira testar, apenas execute o script
in case you want to test, just run the script
]]


local i=0

--valor aleatorio
--local v={math.random(0,10), math.random(0,10), math.random(0,10)}

--valor recebido
--local vstr="Pneumoultramicroscopicosilicovulcanoconiótico"
--local v={math.random(0,10), math.random(0,10), math.random(0,10)}
--for i=1, #vstr do
--	v[i]=string.byte(vstr, i)
--end
local v={math.random(97,122), math.random(97,122), math.random(97,122), math.random(97,122)}
local vstr=string.char(table.unpack(v))
print(v)

local tstr="gato"

--valor esperado
local t={}
for i=1, #tstr do
	t[i]=string.byte(tstr, i)
end
local str=""
local strc=""

while i<250 and tstr~=strc do
	print("\n-----------------\n")
	
	--taxa de aprendizado
	local n=0.1
	
	local f={}
	
	for i=1,#tstr do
		if v[i]==nil then
			v[i]=t[i]
			break
		end
	end
	
	for i=1, #vstr do
		if t[i]==nil then
			table.remove(v, i)
			break
		end
		f[i]=(v[i]-t[i])^2
	end
	
	--soma dos erros quadraticos (perda inicial)
	--local seq=(v[1]-t[1])^2+(v[2]-t[2])^2+(v[3]-t[3])^2
	local seq=0
	for i=1, #f do
		seq+=f[i]
	end

	--derivada
	--local d={2*(v[1]-t[1]), 2*(v[2]-t[2]), 2*(v[3]-t[3])}
	local d={}
	for i=1,#vstr do
		if t[i]==nil or v[i]==nil then
			break
		end
		d[i]=2*(v[i]-t[i])
	end

	--atualizacao
	--v={v[1]-n*d[1], v[2]-n*d[2], v[3]-n*d[3]}
	for i=1,#vstr do
		if t[i]==nil or v[i]==nil then
			break
		end
		v[i]=v[i]-n*d[i]
	end
	
	--decom
	for i=1,#v do
		str=str..string.char(math.round(v[i]))
	end

	print(v)
	print(t)
	print(seq)
	print(d)
	print(vstr," | ", str)
	i+=1
	strc=string.sub(str,#str-#tstr+1,#str)
	print(strc)
	str=str..", "
end
print(i)