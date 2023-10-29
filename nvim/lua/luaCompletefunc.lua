function tableLen(t)
    local length = 0
    for _ in pairs(t) do
        length = length + 1
    end
    return length
end

function tableContains(t, pattern)
    for x in pairs(t) do
        if t[x] == pattern then
            return 1
        end
    end
    return 0
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
        local lines = vim.api.nvim_buf_get_lines(0, 0, vim.api.nvim_buf_line_count(0), 0)
        for linenr in pairs(lines) do
            line = lines[linenr]
            for word in string.gmatch(line, '%f[0-9A-Za-z_-]' .. base .. '[0-9A-Za-z_-]+') do
                if tableLen(matches) >= 30 then
                    return matches
                end
                if tableContains(matches, word) == 0 then
                    table.insert(matches, word)
                end
            end
        end
        return matches
    end
end
