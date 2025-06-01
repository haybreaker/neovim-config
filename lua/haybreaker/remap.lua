vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>w=", "<C-w>=")

vim.keymap.set("n", "<leader>sa", "ggVG\"+y<C-o>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- Nvim-Tree Commands
vim.keymap.set("n", "<leader>eo", "<cmd>NvimTreeOpen<Cr>")
vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeClose<Cr>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


-- Nvim Dap Mappings
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>");
vim.keymap.set("n", "<leader>dt", "<cmd>DapTerminate<CR>");
vim.keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>");
vim.keymap.set("n", "<leader>dfr", "<cmd>FlutterDebug<CR>");
vim.keymap.set("n", "<leader>de", require('dapui').eval);
vim.keymap.set("n", "<leader>dsi", "<cmd>DapStepInto<CR>");
vim.keymap.set("n", "<leader>dso", "<cmd>DapStepOver<CR>");
vim.keymap.set("n", "<leader>dsb", "<cmd>DapStepOut<CR>");

-- Lua setup script for Neovim
vim.api.nvim_set_keymap('n', 'gp', ':lua SwitchBetweenSourceAndHeader()<CR>', { noremap = true, silent = true })

function SwitchBetweenSourceAndHeader()
    local current_dir = vim.fn.expand("%:p:h") -- Get the current file directory

    -- Identify the file extension
    local extension = vim.fn.expand("%:e")
    local base_name = vim.fn.expand("%:t:r")  -- Get the base file name without extension

    -- Define possible header and source extensions
    local header_extensions = { "hpp", "h" }
    local source_extensions = { "cpp" }

    local target_file = nil

    if vim.tbl_contains(source_extensions, extension) then
        -- If we're in a source file, look for the header file
        for _, ext in ipairs(header_extensions) do
            local possible_file = current_dir .. "/" .. base_name .. "." .. ext
            if vim.fn.filereadable(possible_file) == 1 then
                target_file = possible_file
                break
            end
        end
    elseif vim.tbl_contains(header_extensions, extension) then
        -- If we're in a header file, look for the source file
        for _, ext in ipairs(source_extensions) do
            local possible_file = current_dir .. "/" .. base_name .. "." .. ext
            if vim.fn.filereadable(possible_file) == 1 then
                target_file = possible_file
                break
            end
        end
    end

    if target_file then
        -- Open the found file
        vim.cmd("edit " .. target_file)
    else
        print("No corresponding file found.")
    end
end

