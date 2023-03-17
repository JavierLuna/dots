local M = {}

M.treesitter = {
  ensure_installed = {
    "bash",
    "c",
    "css",
    "dockerfile",
    "elixir",
    "go",
    "html",
    "java",
    "javascript",
    "json5",
    "kotlin",
    "llvm",
    "make",
    "python",
    "regex",
    "ruby",
    "rust",
    "scala",
    "scss",
    "smithy",
    "swift",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "yaml",
  },
}

M.mason = {
  ensure_installed = {
    "html-lsp",
    "css-ls",
    "tsserver",
    "dockerls",
    "jsonls",
    "pyright",
    "rust-analyzer",
    "vimls",
    "lua-language-server",
    "smithy-language-server"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
