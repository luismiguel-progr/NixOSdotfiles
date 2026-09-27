return {
  -- Desativa o tema padrão do LazyVim para não dar conflito de cores
  { "folke/tokyonight.nvim", enabled = false },

  -- Configura a interface nativa e aplica o visual Monocromático
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "quiet", -- Usa o tema embutido sem cores do Neovim
    },
    config = function(_, opts)
      -- 1. Cria a função que força o fundo branco puro e texto preto puro
      local function apply_monochrome()
        -- Texto principal e fundo
        vim.api.nvim_set_hl(0, "Normal", { fg = "#000000", bg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "NormalNC", { fg = "#000000", bg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "#FFFFFF" })

        -- Linhas e cursor
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#777777", bg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#F0F0F0" })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#000000", bg = "#F0F0F0", bold = true })

        -- Remove as cores de todo o código (Sintaxe, Palavras-chave, Strings)
        local syntax_groups = {
          "Comment",
          "String",
          "Keyword",
          "Function",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Special",
          "Underlined",
          "Todo",
        }
        for _, group in ipairs(syntax_groups) do
          vim.api.nvim_set_hl(0, group, { fg = "#000000", bg = nil, inherit = false })
        end

        -- Comentários ficam em cinza escuro para melhor leitura
        vim.api.nvim_set_hl(0, "Comment", { fg = "#666666", italic = true })

        -- Árvore de arquivos lateral (Neo-tree)
        vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#000000", bg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { fg = "#000000", bg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#E0E0E0", bg = "#FFFFFF" })
      end

      -- 2. Ativa o tema nativo
      vim.cmd("colorscheme quiet")

      -- 3. Injeta as regras de preto e branco
      apply_monochrome()

      -- Garante que se o Neovim recarregar o tema, ele continue preto e branco
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = apply_monochrome,
      })
    end,
  },
}
