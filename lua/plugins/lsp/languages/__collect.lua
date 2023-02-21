local function f(lang)
  return require(('plugins.lsp.languages.%s'):format(lang))
end

return {
  f 'ansible',
  f 'clang',
  f 'go',
  f 'lua',
  f 'nix',
  f 'xml',
  f 'yaml',
}
