(local {: yank} (require :helpers))
(local elixir (require "helpers.elixir"))

; escaping
(vim.keymap.set "x" "<C-g>" "<Esc>")
(vim.keymap.set [ "n" "i" "v" ] "<C-g>" "<Esc>" {:noremap true})
(vim.keymap.set "i" "jk" "<Esc>" {:noremap true})

; file saving
(vim.keymap.set "n" "<leader>fs" vim.cmd.w)

; window/split navigation
(vim.keymap.set "n" "<leader>1" "<C-w>h")
(vim.keymap.set "n" "<leader>2" "<C-w>l")
(vim.keymap.set "n" "<leader>j" "<C-w>j")
(vim.keymap.set "n" "<leader>k" "<C-w>k")
(vim.keymap.set "n" "<leader>q" vim.cmd.q)
(vim.keymap.set "n" "<leader>|" vim.cmd.vsplit)

; quickfix
(vim.keymap.set "n" "<leader>'" (fn [] (vim.cmd "copen")))

(vim.keymap.set "n" "<leader>cn" (fn []
																	 (vim.cmd "cnext")
																	 "zz"))

(vim.keymap.set "n" "<leader>cp" (fn []
																	 (vim.cmd "cprev")
																	 "zz"))

; useful remaps
; (vim.keymap.set "n" "<C-d>" "<C-d>zz")
; (vim.keymap.set "n" "<C-u>" "<C-u>zz")
(vim.keymap.set "n" "n" "nzzzv")
(vim.keymap.set "n" "N" "Nzzzv")

; paste over stuff!
(vim.keymap.set "x" "<leader>p" "\"_dP")

;;; Helpful Yanks ;;;

;; Elixir module helpers
(vim.keymap.set "n" "<leader>ym" (fn [] (yank (elixir.current-local-module))))
(vim.keymap.set "n" "<leader>yM" (fn [] (yank (elixir.current-absolute-module))))

;; File helpers

; think: "yank File" (absolute)
(vim.keymap.set "n" "<leader>yF" (fn [] (yank (vim.fn.expand "%"))))

; think: "yank file"
(vim.keymap.set "n" "<leader>yf" (fn []
																	 (let [current-file (vim.fn.expand "%")
																				 current-line (vim.fn.line ".")
																				 file-and-line (.. current-file ":" current-line)]
																		 (yank file-and-line))))
