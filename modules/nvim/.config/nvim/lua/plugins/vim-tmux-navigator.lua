-- Navigate seamlessly between Neovim and tmux panes
return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Move to left vim/tmux pane" },
    { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Move to to lower vim/tmux pane" },
    { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Move to upper vim/tmux pane" },
    { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Move to right vim/tmux pane" },
    { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Move to previous vim/tmux pane" },
  },
}
