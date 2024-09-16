return {
  "nvim-cmp",
  dependencies = {
    "supermaven-inc/supermaven-nvim",
    build = ":SupermavenUseFree", -- remove this line if you are using pro
    opts = {},
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp") -- Require cmp to access its API

    -- Insert supermaven source
    table.insert(opts.sources, 1, {
      name = "supermaven",
      group_index = 1,
      priority = 100,
    })

    -- Set up keymaps
    opts.mapping = {
      -- Accept suggestion with <Tab>
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),

      -- Clear suggestion with <C-]>
      ["<C-]>"] = cmp.mapping.abort(), -- This aborts the current completion

      -- Accept word with <C-j>
      ["<C-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item() -- You can define this action to select the next suggestion
        else
          fallback()
        end
      end, { "i", "s" }), -- 'i' for insert mode, 's' for select mode
    }
  end,
}
