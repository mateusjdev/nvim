local M = {}

M.notifyToggled = function(option, enabled, opts)
    opts = opts or { ttl = 2 }
    if enabled then
        vim.notify(option .. ": ON", vim.log.levels.INFO, opts)
    else
        vim.notify(option .. ": OFF", vim.log.levels.INFO, opts)
    end
end

M.notifyUnavaliable = function(option, opts)
    opts = opts or { ttl = 2 }
    vim.notify(option .. " not avaliable", vim.log.levels.WARN, opts)
end

M.hasExecuTable = function(executables)
    local has_exec = function(c) ---@param c string
        return c ~= vim.NIL and vim.fn.executable(c) == 1
    end

    if type(executables) == "string" then
        return has_exec(executables)
    elseif type(executables) == "table" then
        return vim.tbl_filter(has_exec, executables)[1] ~= nil
    end
    return false
end

return M
