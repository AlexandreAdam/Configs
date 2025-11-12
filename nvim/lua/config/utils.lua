-- =========================================
--  Custom Utilities
-- =========================================

-- Manim integration
function RunManimScene(quality)
  local filename = vim.fn.expand("%:t")
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local scenename = nil

  -- Try to auto-detect the class name inheriting from Scene
  for _, line in ipairs(lines) do
    local name = string.match(line, "class%s+([A-Za-z0-9_]+)%s*%(%s*Scene%s*%)")
    if name then
      scenename = name
      break
    end
  end

  scenename = scenename or vim.fn.input("Scene name: ", "")

  local quality_flag = "-q" .. (quality or "l")
  local subdir = (quality == "h") and "1080p60" or "480p15"
  local outfile = string.format(
    "media/videos/%s/%s/%s.mp4",
    vim.fn.expand("%:r"),
    subdir,
    scenename
  )

  local cmd = string.format(
    "manim %s %s %s %s && mpv --fs --loop %s",
    quality_flag,
    filename,
    scenename,
    "",
    outfile
  )

  print("Running: " .. cmd)
  vim.cmd("!" .. cmd)
end


-- Terminal helper: run current file in active Conda environment
local M = {}

function M.start_terminal_in_conda_env()
  -- Get current Conda env name
  local handle = io.popen("conda env list | awk '$2 ~ /\\*/ {print $1}'")
  local conda_env = handle:read("*a")
  handle:close()
  conda_env = conda_env:gsub("%s+", "") -- trim spaces/newlines

  if conda_env ~= "" then
    -- Save file before running
    vim.cmd("w")
    local file_path = vim.fn.expand("%:p")
    local cmd = "conda activate " .. conda_env .. " && python " .. file_path
    vim.cmd("split term://" .. cmd)
  else
    print("No active Conda environment found.")
  end
end

return M
