local M = {
  'nvim-orgmode/orgmode',
}

function M.config()
  local orgmode = require 'orgmode'
  orgmode.setup_ts_grammar()

  orgmode.setup {
    org_agenda_files = { '~/vimnotes/agenda/*' },
    org_default_notes_file = '~/vimnotes/notes.org',
  }
end

return M
