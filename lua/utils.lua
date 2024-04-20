local M = {}

M.notifyToggled = function (option, enabled, opts)
    opts = opts or { ttl = 2 }
    if enabled then
        vim.notify(option .. ": ON", vim.log.levels.INFO, opts)
    else
        vim.notify(option .. ": OFF", vim.log.levels.INFO, opts)
    end
end

M.notifyUnavaliable = function (option, opts)
    opts = opts or { ttl = 2 }
    vim.notify(option .. " not avaliable", vim.log.levels.WARN, opts)
end

M.hasExecuTable = function (executables)
    local has_exec = vim.tbl_filter(function(c) ---@param c string
        return c ~= vim.NIL and vim.fn.executable(c) == 1
    end, executables)[1]
    if has_exec ~= nil then
        return true
    else
        return false
    end
end

return M
