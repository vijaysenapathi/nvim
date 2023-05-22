vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern={"Jenkinsfile"},
  callback = function (_)
    vim.opt["syntax"] = "groovy"
  end
})

