# My DotFiles

## NeoVim

Basic nvim configuration is split up into separate files:

- `init.vim`
  Main configuration
- `macos.vim`
  MacOS specific settings
- `maps.vim`
  General keyboard mappings
- `plug.vim`
  Plugin loading stuff

### COC.NVIM

Install language servers separately:

- `CocInstall coc-json`
- `CocInstall coc-pyright`
- `CocInstall coc-yaml`
- `CocInstall coc-markdownlint`

Change paths in `coc-settings.json` or place a `pyrightconfig.json` in project
root directory with adjusted paths (especially for `black`, `flake8` and `pydocstyle`)

