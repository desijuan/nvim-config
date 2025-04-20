return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter.configs").setup {
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- Function bodies
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            -- Classes/structs (language-dependent)
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            -- Loops
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
            -- Conditionals
            ["a?"] = "@conditional.outer",
            ["i?"] = "@conditional.inner",
            -- Blocks (e.g., inside {})
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            -- Parameters (arguments)
            ["a,"] = "@parameter.outer",
            ["i,"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- Whether to add jumps to the jumplist
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]p"] = "@parameter.outer", -- Jump to next parameter
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[p"] = "@parameter.outer", -- Jump to previous parameter
          },
        },
        -- swap = {
        --   enable = true,
        --   swap_next = {
        --     ["<leader>a"] = "@parameter.inner", -- Swap with next parameter
        --   },
        --   swap_previous = {
        --     ["<leader>A"] = "@parameter.inner", -- Swap with previous parameter
        --   },
        -- },
      },
    }
  end,
}
