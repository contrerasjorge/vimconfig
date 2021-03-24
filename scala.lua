-- These are settings for scala metals lsp I don't use them simple because intellij
-- just works better, but in case metals ever becomes better here this is for future reference

--****************************************************************************

--Plug 'scalameta/nvim-metals'


  --cmd = vim.cmd

  --cmd [[augroup lsp]]
  --cmd [[au!]]
  --cmd [[au FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)]]
  --cmd [[augroup end]]


  --metals_config = require'metals'.bare_config
  --metals_config.settings = {
    --showImplicitArguments = true,
    --showInferredType = true,
    --excludedPackages = {
      --"akka.actor.typed.javadsl",
      --"com.github.swagger.akka.javadsl"
    --}
  --}

  --metals_config.on_attach = function()
    --require'completion'.on_attach();
    --require'metals'.setup_dap()


    --metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    --vim.lsp.diagnostic.on_publish_diagnostics, {
      --virtual_text = {
        --prefix = '',
      --}
    --}
  --)
  --end

  --local dap = require('dap')
  --dap.configurations.scala = {
      --{
        --type = 'scala',
        --request = 'launch',
        --name = 'Run',
        --metalsRunType = 'run'
      --},
      --{
        --type = 'scala',
        --request = 'launch',
        --name = 'Test File',
        --metalsRunType = 'testFile'
      --},
      --{
        --type = 'scala',
        --request = 'launch',
        --name = 'Test Target',
        --metalsRunType = 'testTarget'
      --}
    --}

