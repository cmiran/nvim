-- function File_exists(path)
--    local file = io.open(path, "r")

--    return file ~= nil and io.close(file)
-- end

-- function Config_file_exists_at_root_pattern(paths)
--   for _, root in ipairs(vim.lsp.list_workspace_folders()) do
--     for _, path in ipairs(paths) do
--       if File_exists(root .. path) then
--         return true
--       end
--     end
--   end
-- end
