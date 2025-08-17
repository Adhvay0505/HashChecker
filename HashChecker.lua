local md5 = require("md5")

function file_hash(filename)
	local file = io.open(filename, "rb")
	if not file then
		print("Cannot open the file: " .. filename)
		return nil
	end

	local content = file:read("*a")
	file:close()
	return md5.sumhexa(content)
end

local input_filename = arg[1]
if not input_filename then
	print("Usage : lua file.lua <filename>")
	os.exit(1)
end

local hash = file_hash(input_filename)
if hash then
	print("MD5 hash: ", hash)
end

