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

- [ ] Migrate away from the archived `nvim-treesitter` implementation
    - Evaluate other parser managers or community forks before future Neovim or parser updates cause compatibility issues
    - Alternatives:
        - [romus204/tree-sitter-manager.nvim](https://github.com/romus204/tree-sitter-manager.nvim)

- [ ] Verify whether `neotest` works with `tree-sitter-manager.nvim`
    - Most `neotest` adapters rely on `nvim-treesitter` for test discovery
    - Determine whether the required parsers and queries work without keeping `nvim-treesitter` installed

- [ ] Install `nvim-dap` plugin
