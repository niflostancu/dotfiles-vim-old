" Git integration plugins
let plug = vimconf#plugin#register("debugging")

let plug.nvim_dap = {'from': 'mfussenegger/nvim-dap'}
let plug.nvim_dap_ui = {'from': 'rcarriga/nvim-dap-ui'}
" let plug.nvim_dap_install = {'from': 'Pocco81/DAPInstall.nvim'}

let g:cortex_debug_path = $VIM_CACHE . "/cortex-debug"

function plug.nvim_dap.hook_add() dict
	lua <<EOF
	local dap = require('dap')
	dap.set_log_level('DEBUG')

	dap.adapters.cortexdebug = {
		id = 'cortexdebug',
		type = 'executable',
		command = 'node',
		args = { vim.g["cortex_debug_path"] .. '/dist/debugadapter.js' },
		options = { cwd = vim.g["cortex_debug_path"] },
	}
	dap.configurations.c = {
		{
			type = 'cortexdebug';
			request = 'launch';
			name = "Cortex Server";

			executable = 'objs/onewire_low_v1/main.elf',
			cwd = '${workspaceFolder}',
			extensionPath = vim.g["cortex_debug_path"],
			servertype = "external",
			gdbPath = "arm-none-eabi-gdb",
			gdbTarget = 'localhost:3333',
			swoConfig = { enabled = false, },
			rttConfig = { enabled = false, },
			toolchainPrefix = "arm-none-eabi",
			showDevDebugOutput = "both",
			dbgServerLogfile = "~/gdbserver.log",
			gdbServerConsolePort = 3344,
			runToMain = true,
			preLaunchCommands = { },
			postLaunchCommands = {},
			preAttachCommands = {},
			postAttachCommands = {},
			},
		{
			name = 'Attach to gdbserver :3333',
			type = 'cpptools',
			request = 'launch',
			MIMode = 'gdb',
			stopAtEntry = true,
			cwd = '${workspaceFolder}',
			program = 'objs/onewire_low_v1/main.elf',
			setupCommands = {
				{ text = "-target-select remote localhost:3333",
					description = "connect to target", ignoreFailures = false },
			},
			linux = {
				MIMode = "gdb",
				MIDebuggerPath = "arm-none-eabi-gdb",
				debugServerPath = "make",
				debugServerArgs = "gdbserver",
				externalConsole = false,
			},
			logging = {
				moduleLoad = true,
				trace = true,
				engineLogging = true,
				programOutput = true,
				exceptions = true
			},
		},
	}
	-- require('dap.ext.vscode').load_launchjs()
EOF

	nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
	nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
	nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
	nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
	nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
	nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
	nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
	nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
	nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
endfunction

function plug.nvim_dap_ui.hook_add() dict
	lua <<EOF
	local dap, dapui = require("dap"), require("dapui")
	dapui.setup()
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
EOF
endfunction

function plug.nvim_dap_install.hook_add() dict
	lua <<EOF
	local dap_install = require("dap-install")
	dap_install.config("ccppr_vsc", {
		
	})

EOF
endfunction

