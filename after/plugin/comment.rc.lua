local present, nvim_comment = pcall(require, "Comment")

if not present then
  return
end

local options = {}
options = load_override(options, "numToStr/Comment.nvim")
nvim_comment.setup(options)
