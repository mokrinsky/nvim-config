local function f(lang)
  return require(('yumivim.plugins.lsp.languages.%s'):format(lang))
end

return {
  f 'ansible',
  f 'clang',
  f 'git',
  f 'go',
  f 'lua',
  f 'nix',
  f 'python',
  f 'sh',
  f 'xml',
  f 'yaml',
}
