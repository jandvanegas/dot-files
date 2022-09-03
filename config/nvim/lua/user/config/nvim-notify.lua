local M = {}

function M.setup()
  require("notify").setup(
    {
      minimum_width = 50,
      max_width = 50,
      render = "default",
      stages = "fade_in_slide_out",
      timeout = 2000
    }
  )
end

return M
