local M = {}

function M.start_terminal_in_conda_env()
    -- Get the current active Conda environment.
    local handle = io.popen("conda env list | awk '$2 ~ /\\*/ {print $1}'")
    local conda_env = handle:read("*a")
    handle:close()
    conda_env = conda_env:gsub("%s+", "") -- Trim whitespaces

    -- If Conda environment is found, open the terminal with it.
    if conda_env ~= "" then
        -- Save the current buffer.
        vim.api.nvim_command('w')

        -- Get the current file path.
        local file_path = vim.api.nvim_buf_get_name(0)
        
        local cmd = "conda activate " .. conda_env .. " && python " .. file_path
        vim.api.nvim_command('split term://'..cmd)
    else
        print("No active Conda environment found.")
    end
end

return M

