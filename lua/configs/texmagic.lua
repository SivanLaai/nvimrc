-- Run setup and specify two custom build engines
--

local M = {}

M.engines = {

       pdflatex = {    -- This has the same name as a default engine but would
                       -- be preferred over the same-name default if defined
           executable = "latexmk",
           args = {
               "-pdflatex",
               "-interaction=nonstopmode",
               "-synctex=1",
               "--output-directory=build",
               "-bibfudge-",
               "-pv",
               "%f"
           },
           pdfDirectory = "build",
           auxDirectory = "build",
           logDirectory = "build",
           onSave = false,
		   forwardSearchAfter = false,
        --    isContinuous = false
       },
       lualatex = {    -- This is *not* one of the defaults, but it can be
                       -- called via magic comment if defined here
           executable = "latexmk",
           args = {
               "-pdflua",
               "-interaction=nonstopmode",
               "-synctex=1",
               "--output-directory=build",
               "-bibfudge-",
               "-pv",
               "%f"
           },
           pdfDirectory = "build",
           auxDirectory = "build",
           logDirectory = "build",
           onSave = true,
		--    forwardSearchAfter = true,
        --    isContinuous = false
       }
   }

require('texmagic').setup{
   engines = M.engines
}

return M
