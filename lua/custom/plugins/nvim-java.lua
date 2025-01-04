return {
  {
    'nvim-java/nvim-java',
    jdtls = function()
      require('java').setup {}
    end,
    require('lspconfig').jdtls.setup {},
  },
}
