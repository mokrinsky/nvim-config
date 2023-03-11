local function f(lang)
  return require(('yumivim.plugins.lsp.languages.%s'):format(lang))
end

return {
  f 'ansible',
  f 'clang',
  f 'go',
  f 'lua',
  f 'nix',
  f 'python',
  f 'xml',
  f 'yaml',
}
