# AGENTS.md

## Project Overview

NixOS flake-based configuration managed via Nix Flakes + Home Manager.
Hostname: `lachata`, user: `dante`. System: `x86_64-linux`.

## Build / Lint / Test Commands

```bash
just check                        # Validate flake (nix flake check)
just rebuild                      # Build+switch NixOS config
just hm                           # Build+switch home-manager config
just upgrade                      # rebuild + hm
just update                       # Update flake lockfile inputs
just clean                        # GC old Nix store generations (>7d)
```

There are no per-file tests. Validation is done via `nix flake check` which
verifies module structure, attribute set shapes, and basic Nix syntax. For
syntax-level validation of a single file, use:

```bash
nix-instantiate --eval --strict <file>
```

Formatting: No auto-formatter is configured. Match the existing style (see
below). If you add a formatter in the future, prefer `nixfmt` or `alejandra`.

## Code Style Guidelines

### File Structure

Every Nix file returns a function (`{ ... }: { ... }`) or bare attrset.
Module function arguments destructure only what's needed:

```nix
{ pkgs, inputs, ... }:   # good: explicit, no unused args
{ config, lib, ... }:    # good: typical NixOS module pattern
{ ... }:                 # good: no extra args needed
```

Avoid `with lib;` or `with pkgs;` at top-level — prefer:
```nix
lib.lists.optionals ...  # explicit path
```

### Imports

- Aggregator modules use `imports = [ ./submod1.nix ./submod2.nix ];`
- Each path on its own line, no trailing comma (Nix doesn't use them).
- Relative paths (`./foo.nix`, `../../modules/shared`), never absolute.

### Naming Conventions

| Thing | Convention | Example |
|-------|-----------|---------|
| Files/dirs | kebab-case | `hardware-configuration.nix`, `home-manager` |
| Attribute names | camelCase | `defaultNetwork.settings.dns_enabled` |
| NixOS options | dot-separated | `services.pipewire.enable` |
| Variables | camelCase | `specialArgs`, `extraSpecialArgs` |
| Module arg | lowercase, maybe underscore | `pkgs`, `inputs`, `lib` |

### NixOS Module Style

```nix
{ config, lib, pkgs, ... }:     # ↑ one blank line after function header

{                               # ↑ attrset opens on its own line
  services.foo = {
    enable = true;
    setting = "value";
  };

  programs.bar = {
    enable = true;
  };
}
```

- One blank line between top-level option blocks.
- No blank line between an option and its first sub-option.
- Indent: 2 spaces.
- Final attribute in a block has no extra blank line before `}`.
- Use `true`/`false` booleans, not string equivalents.

### Lists

```nix
# multi-element: one per line
extraGroups = [
  "networkmanager"
  "wheel"
  "video"
];

# single element: inline
modules = [ ./hosts/lachata ];
```

### Strings and Quotes

- Double quotes for most strings.
- Single-quoted `''` multi-line strings (`initContent = ''...'';`).
- Use `lib.strings.optionalString` for conditional strings.

### Error Handling / Safety

- Nix is pure and declarative — there is no runtime error handling.
- Use `lib.assertMsg` or `lib.assertOneOf` for module option validation.
- Prefer `lib.mkIf cond { ... }` over conditional imports for optional features.
- Use `lib.types` for option type checking: `lib.types.str`, `lib.types.bool`,
  `lib.types.listOf lib.types.str`, etc.
- `hardware-configuration.nix` is auto-generated; never edit it directly.

### `flake.nix` Conventions

- Flake description is a short, quoted string.
- `inputs` use `url = "github:owner/repo/branch"`.
- Use `inherit system;` / `inherit pkgs;` / `inherit inputs;` patterns.
- `specialArgs` / `extraSpecialArgs` pass `inputs` to submodules.
- `nixosConfigurations.<host>` and `homeConfigurations.<user>` are the two
  standard outputs.

### home-manager Module Style

Same as NixOS modules but under `home` namespace:

```nix
{ pkgs, ... }:

{
  home.packages = with pkgs; [ ... ];
  programs.git = { ... };       # home-manager programs
}
```

### `with` usage

- `with pkgs;` is **only** acceptable inside `home.packages` lists.
- Everywhere else, avoid `with` — spell out the full path.

### Aliases / justfile

The `justfile` is the canonical task runner. Alias `j` is available in Zsh:
```bash
j check       # runs just check
j rebuild     # runs just rebuild
```

### Git

- Remote: `git@github.com:DanteZulli/my-nixos-configs.git`
- Branch: `main`, with `autoSetupRemote = true` configured.
- Commit messages: imperative mood, lowercase, no trailing period,
  e.g. "add opencode package to user packages".
