# TODO

## Docs

- [ ] Create a `docs/` directory for plans, specifications, and other project documentation.

## Installers

- [ ] Revisit runner structure
    - Some runners were made too similar despite having different workflows
    - Goal: reduce indirection without making naming inconsistent

- [ ] Review `configure_rodecaster_pipewire` setup
    - Inspect the upstream [configure.sh]("https://parzival-space.github.io/rodecaster-pro-2-virtual-devices-pipewire/configure.sh") script for security concerns and unexpected system changes
    - Decide whether to maintain a local configuration script or pin the installer to a specific upstream version

## Modules

- [ ] Create `aerospace` config
    - Reference [aerospace docs]("https://nikitabobko.github.io/AeroSpace/guide")

- [ ] Reorganize the `linux-scripts` module to match the new directory structure
    - Move scripts into the appropriate locations and update any affected paths, sources, or stow mappings

### Nvim

- [ ] Migrate from `nvim-treesitter` to `tree-sitter-manager` plugin

- [ ] Install `nvim-dap` plugin
