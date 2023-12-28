local g = vim.g

g.vimtex_mappings_enabled = 1

if g.is_win then
  g.vimtex_view_general_viewer = 'SumatraPDF'
  g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
end
if g.is_mac then
    g.vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    g.vimtex_view_general_options = '-r @line @pdf @tex'

    g.vim.cmd([[
      augroup vimtex_mac
        autocmd!
        autocmd User VimtexEventCompileSuccess call UpdateSkim()
      augroup END

      " The following code is adapted from https://gist.github.com/skulumani/7ea00478c63193a832a6d3f2e661a536.
      function! UpdateSkim() abort
        let l:out = b:vimtex.out()
        let l:src_file_path = expand('%:p')
        let l:cmd = [g:vimtex_view_general_viewer, '-r']

        let l:cmd = [g:vimtex_view_general_viewer, '-r']

        if !empty(system('pgrep Skim'))
          call extend(l:cmd, ['-g'])
        endif

        call jobstart(l:cmd + [line('.'), l:out, l:src_file_path])
      endfunction
  ]])
end
g.vimtex_quickfix_open_on_warning = 0
--g.vimtex_compiler_method = 'latexrun'
--g.vimtex_compiler_method = 'latexmk'
g.vimtex_compiler_latexmk = {
    build_dir= "build",
    options= {
      '-verbose',
      '-file-line-error',
      '-synctex=1',
      '-interaction=nonstopmode',
      "-bibfudge-",
    }
}
-- TOC settings
g.vimtex_toc_config = {
        name = 'TOC',
        layers = {'content', 'todo', 'include'},
        resize = 1,
        split_width = 30,
        todo_sorted = 0,
        show_help = 1,
        show_numbers = 1,
        mode = 2,
        }
