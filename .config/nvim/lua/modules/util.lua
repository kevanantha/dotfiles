local Job = require("plenary.job")

Util = {}

Util.check_backspace = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

Util.check_html_char = function()
  local prev_col, next_col = vim.fn.col('.') - 1, vim.fn.col('.')
  local prev_char = vim.fn.getline('.'):sub(prev_col, prev_col)
  local next_char = vim.fn.getline('.'):sub(next_col, next_col)

  if prev_char:match('>') and next_char:match('<') then
    return true
  else
    return false
  end
end

-- preview file using xdg_open
Util.xdg_open = function()
  local filename = vim.fn.expand("<cfile>")
  vim.loop.spawn("xdg-open", {args = {filename}})
end

local to_rgb = function(hex)
  local red, green, blue, alpha

  if #hex == 9 then
    _, red, green, blue, alpha = hex:match('(.)(..)(..)(..)(..)')
    return string.format(
      'rgba(%s, %s, %s, %s)',
      tonumber("0x" .. red), tonumber("0x" .. green),
      tonumber("0x" .. blue), tonumber("0x" .. alpha)
    )
  end

  _, red, green, blue = hex:match('(.)(..)(..)(..)')
  return string.format(
    'rgb(%s, %s, %s)',
    tonumber("0x" .. red), tonumber("0x" .. green), tonumber("0x" .. blue)
  )
end

local to_hex = function(rgb)
  local red, green, blue, alpha
  if #rgb >= 16 then
    red, green, blue, alpha = rgb:match("%((%d+),%s(%d+),%s(%d+),%s(%d+)")
    return string.format('#%x%x%x%x', red, green, blue, alpha)
  end

  red, green, blue = rgb:match("%((%d+),%s(%d+),%s(%d+)")
  return string.format('#%x%x%x', red, green, blue)
end

local get_word = function()
  local first_line_num, last_line_num = vim.fn.getpos("'<")[2], vim.fn.getpos("'>")[2]
  local first_col, last_col = vim.fn.getpos("'<")[3], vim.fn.getpos("'>")[3]
  local current_word = vim.fn.getline(first_line_num, last_line_num)[1]:sub(first_col, last_col)

  return current_word
end

Util.convert_color = function(mode)
  local result

  if mode == 'rgb' then
    result = to_rgb(get_word())
  else
    result = to_hex(get_word())
  end

  vim.api.nvim_command(string.format('s/%s/%s', get_word(), result))
end

vim.api.nvim_exec([[
  command! -nargs=? -range=% ToRgb call v:lua.Util.convert_color('rgb')
  command! -nargs=? -range=% ToHex call v:lua.Util.convert_color('hex')
]], true)

-- translate selected word, useful for when I do jp assignments
Util.translate = function(lang)
  local word = get_word()
  local job = Job:new({
    command = "trans",
    args = {"-b", ":" .. (lang or "en"), word}
  })

  local ok, result = pcall(function() return vim.trim(job:sync()[1]) end)

  if ok then print(result) end
end

Util.is_cfg_present = function(cfg_name)
  -- this returns 1 if it's not present and 0 if it's present
  -- we need to compare it with 1 because both 0 and 1 is `true` in lua
  return vim.fn.empty(vim.fn.glob(vim.loop.cwd()..cfg_name)) ~= 1
end

return Util

