local M = {}
function M.setup()
  local home = os.getenv('HOME')
  -- db.custom_header -- type can be nil,table or function(must be return table in function)
  -- if not config will use default banner
  -- db.custom_center  -- table type and in this table you can set icon,desc,shortcut,action keywords. desc must be exist and type is string
  -- icon type is nil or string
  -- shortcut type is nil or string also like icon
  -- action type can be string or function or nil.
  local this_config = {
    header = {
      '',
      ' _            _    _            _          _  _  ',
      '| |      ___ | |_ ( ) ___    __| |  ___   (_)| |_',
      '| |     / _ \\| __||/ / __|  / _` | / _ \\  | || __|',
      '| |___ |  __/| |_    \\__ \\ | (_| || (_) | | || |_',
      '|_____| \\___| \\__|   |___/  \\__,_| \\___/  |_| \\__|',
      '',
      'Juan Andres V.',
    },
  }
  local hide = require('dashboard').setup {
    theme = 'hyper',
    config = this_config,
    hide = {
      statusline = false,
    },
    preview = {
      file_height = 12,
      file_width = 80,
    },
  }
end

return M
