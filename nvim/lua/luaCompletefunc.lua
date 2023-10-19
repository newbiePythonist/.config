function LuaCompFunc(findstart, base)
    if findstart == 1 then
        -- Locate the start of the word
        local line = vim.fn.getline('.')
        local start = vim.fn.col('.')
        while start > 1 and string.match(line:sub(start, start), '%a') do
            start = start - 1
        end
        return start
    else
        local matches = {}
        -- iterate over all listed buffers
        for bufnr=1,vim.fn.bufnr('$') do
            -- if buffer is listed, iterate over all lines inside it
            if vim.fn.buflisted(bufnr) == 1 then
                local bufname = vim.fn.bufname(bufnr)
                local lines = vim.api.nvim_buf_get_lines(bufnr, 0, vim.api.nvim_buf_line_count(bufnr), 0)
                -- start iterating over lines in <bufnr>
                for x in pairs(lines) do
                    local line = lines[x]
                    -- if line matches <pattern>, remove surrounding text and add it to the completion table
                    if string.match(line, '^%s*%w+ = ') then
                        local matched = string.match(line, '^%s*%w+ = ')
                        matched = string.gsub(matched, '^%s*', '')
                        matched = string.gsub(matched, ' = ', '')
                        table.insert(matches, { word = matched, kind = 'Variable ' .. bufname })
                    end
                    if string.match(line, '^%s*def %w+%(') then
                        local matched = string.match(line, '^%s*def %w+%(')
                        matched = string.gsub(matched, '^%s*def ', '')
                        matched = string.gsub(matched, '%($', '')
                        table.insert(matches, { word = matched, kind = 'Function ' .. bufname })
                    end
                end
            end
        end
        return matches
    end
end
