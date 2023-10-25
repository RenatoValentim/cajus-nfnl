(vim.api.nvim_create_autocmd [:FileType]
                             {:callback (fn []
                                          (vim.cmd "nnoremap <silent> <buffer> q :close<CR> set nobuflisted"))
                             :pattern [:qf :help :man :lspinfo :spectre_panel]})
(vim.api.nvim_create_autocmd [:FileType]
                             {:callback (fn [] (set vim.opt_local.wrap true)
                                          (set vim.opt_local.spell true))
                              :pattern [:gitcommit :markdown]})
(vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
(vim.api.nvim_create_autocmd [:VimResized]
                             {:callback (fn [] (vim.cmd "tabdo wincmd ="))})
(vim.api.nvim_create_autocmd [:CmdWinEnter] {:callback (fn [] (vim.cmd :quit))})
(vim.api.nvim_create_autocmd [:TextYankPost]
                             {:callback (fn []
                                          (vim.highlight.on_yank {:higroup :Visual
                                                                  :timeout 200}))})
(vim.api.nvim_create_autocmd [:BufWritePost]
                             {:callback (fn [] (vim.lsp.codelens.refresh))
                              :pattern [:*.java]})
(vim.api.nvim_create_autocmd [:VimEnter]
                             {:callback (fn []
                                          (vim.cmd "hi link illuminatedWord LspReferenceText"))})
(vim.api.nvim_create_autocmd [:BufWinEnter]
                             {:callback (fn []
                                          (local line-count
                                                 (vim.api.nvim_buf_line_count 0))
                                          (when (>= line-count 5000)
                                            (vim.cmd :IlluminatePauseBuf)))})
(local format-sync-grp (vim.api.nvim_create_augroup :GoImport {}))
(vim.api.nvim_create_autocmd :BufWritePre
                             {:callback (fn []
                                          ((. (require :go.format) :goimport)))
                              :group format-sync-grp
                              :pattern :*.go})	
