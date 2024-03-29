function tableLen(t)
    local length = 0
    for _ in pairs(t) do
        length = length + 1
    end
    return length
end

function tableContains(t, pattern)
    for _,x in ipairs(t) do
        if x.word == pattern then 
            return true
        end
        -- iterate over each subtable item to search for <pattern>
        -- for j in pairs(t[x]) do
            -- if t[x][j] == pattern then
                -- return true
            -- end
        -- end
    end
    return false
end

function LuaCompFunc(findstart, base)
    if findstart == 1 then
        -- Locate the start of the word
        local line = vim.fn.getline('.')
        local start = vim.fn.col('.') - 1
        while start >= 1 and string.match(line:sub(start, start), '%a') do
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

function LuaCompleteWords(findstart, base)
    if findstart == 1 then
        -- Locate the start of the word
        local line = vim.fn.getline('.')
        local start = vim.fn.col('.') - 1
        while start >= 1 and string.match(line:sub(start, start), '[0-9A-Za-z_-]') do
            start = start - 1
        end
        return start
    else
        local matches = {}
        local added = {}
        local length = 0
        -- iterate over all listed buffers
        for bufnr=0,vim.fn.bufnr('$') do
            -- if buffer is listed, iterate over all lines inside it
            if vim.fn.buflisted(bufnr) then
                local bufname = vim.fn.bufname(bufnr)
                -- don't show current bufname in the completion menu
                if bufnr == 0 then
                    bufname = ''
                -- current buffer has already been iterated when bufnr was equal to 0, so let's skip it
                elseif bufnr == vim.fn.bufnr() then
                    bufname = ''
                    goto continue
                end
                -- start iterating over lines in <bufnr>
                local lines = table.concat(vim.api.nvim_buf_get_lines(bufnr, 0, -1, 0), ' ')
                for match in string.gmatch(lines, '%f[0-9A-Za-z_-]' .. base .. '[0-9A-Za-z_-]+%(?') do
                    -- limit matches to a max of 30 entries
                    if #matches >= 30 then
                        return matches
                    end
                    -- check if matched word is already present, if not then add it (a key based table is used to avoid iterating over each item)
                    if not added[match] then
                        added[match] = true
                        length = length + 1
                        table.insert(matches, { word = match, kind = bufname })
                    end
                    ----- <OLD CODE> -----
                    -- if not tableContains(matches, match) then
                    -- table.insert(matches, { word = match, kind = bufname })
                    -- end
                end
            end
            ::continue::
        end
        return matches
    end
end
