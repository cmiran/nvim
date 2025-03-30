local util = require("lspconfig.util")

local root_files = {
  "hardhat.config.js",
  "hardhat.config.ts",
  "foundry.toml",
  "remappings.txt",
  "truffle.js",
  "truffle-config.js",
  "ape-config.yaml",
}

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local function get_foundry_remappings()
  local handle = io.popen("forge remappings")
  if not handle then return {} end
  local result = handle:read("*a")
  handle:close()

  local args = {}
  for line in result:gmatch("[^\r\n]+") do
    vim.notify(line)
    table.insert(args, line)
  end
  return args
end

-- local function get_foundry_remappings()
--   local handle = io.popen("forge remappings")
--   if not handle then return {} end
--   local result = handle:read("*a")
--   handle:close()

--   local args = {}
--   for line in result:gmatch("[^\r\n]+") do
--     local key, value = line:match("([^=]+)=(.+)")
--     if key and value then
--       table.insert(args, "--include-path="  .. value)
--     end
--   end
--   return args
-- end

-- local function get_foundry_remappings()
--   local handle = io.popen("forge remappings")
--   if not handle then return {} end
--   local result = handle:read("*a")
--   handle:close()

--   local args = {}
--   for line in result:gmatch("[^\r\n]+") do
--     local key, value = line:match("([^=]+)=(.+)")
--     if key and value then
--       table.insert(args, "--include-path=" .. key .. "=" .. value)
--     end
--   end
--   return args
-- end

return {
  vim.notify(dump(get_foundry_remappings())),
  cmd = vim.list_extend({"solc", "--base-path=.", "--lsp" }, get_foundry_remappings()),
  -- cmd = { "solc", "--lsp", table.unpack(get_foundry_remappings()) },
  filetypes = { "solidity" },
  root_dir = util.root_pattern(unpack(root_files)) or util.root_pattern(".git"),
}
