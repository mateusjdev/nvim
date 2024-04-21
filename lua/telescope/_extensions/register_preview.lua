local actions = require "telescope.actions"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local make_entry = require "telescope.make_entry"
local conf = require("telescope.config").values
local putils = require "telescope.previewers.utils"
local previewers = require "telescope.previewers"

local ns_previewer = vim.api.nvim_create_namespace "telescope.previewers"

-- TODO: Use config?
-- https://github.com/nvim-telescope/telescope.nvim/issues/2933

local registers = function(opts)
  local registers_table = { '"', "-", "#", "=", "/", "*", "+", ":", ".", "%" }

  -- named
  for i = 0, 9 do
    table.insert(registers_table, tostring(i))
  end

  -- alphabetical
  for i = 65, 90 do
    table.insert(registers_table, string.char(i))
  end

  opts = opts or {}

  local jump_to_line = function(self, bufnr, lnum)
    pcall(vim.api.nvim_buf_clear_namespace, bufnr, ns_previewer, 0, -1)
    if lnum and lnum >= 0 then
      pcall(vim.api.nvim_buf_add_highlight, bufnr, ns_previewer, "TelescopePreviewLine", lnum - 1, 0, -1)
      pcall(vim.api.nvim_win_set_cursor, self.state.winid, { lnum, 0 })
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd "norm! zz"
      end)
    end
  end

  pickers.new(opts, {
    prompt_title = "Registers",
    finder = finders.new_table {
      -- TODO: hide empty registers
      results = registers_table,
      -- TODO: fix highlight of chars like [] outside entry title
      entry_maker = opts.entry_maker or make_entry.gen_from_registers(opts),
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(_, map)
      actions.select_default:replace(actions.paste_register)
      map({ "i", "n" }, "<C-e>", actions.edit_register)

      return true
    end,
    previewer = previewers.new_buffer_previewer {
      title = "Registers",

      dyn_title = function(_, entry)
        return "Register [" .. entry.value .. "]"
      end,

      -- TODO: check need to reuse buffers
      get_buffer_by_name = function(_, _entry)
        -- return "registers_" .. tostring(entry.index)
        return "registers"
      end,

      define_preview = function(self, entry, status)
        -- wrap lines
        local replacement = vim.split(vim.fn.getreg(entry.value), "\n")
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, replacement)

        local query = status.picker:_get_prompt()

        putils.job_maker("", self.state.bufnr, {
          value = entry.value,
          bufname = entry.value,
          callback = function(bufnr)
            local lnum = 0
            if query and query ~= "" then
              vim.api.nvim_buf_call(bufnr, function()
                vim.cmd "keepjumps norm! gg"
                lnum = vim.fn.search(query .. "\\c", "W")
                vim.cmd "norm! zz"
              end)
            end
            jump_to_line(self, bufnr, lnum)
          end,
        })
      end,
    }
  }):find()
end

return require("telescope").register_extension({
  exports = { registers = registers },
})
