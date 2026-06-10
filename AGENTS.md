# AGENTS.md

Single-host NixOS flake (`lachata`, user `dante`, x86_64-linux).
System: `nixos-26.05`, home-manager: `release-26.05` (`system.stateVersion` = `"25.11"` — expected to lag).

## Commands

```bash
just rebuild        # check + format (alejandra) + nixos-rebuild switch (system + home-manager)
just debug          # rebuild with --show-trace --verbose
just update         # nix flake update
just clean          # keep last 10 system + user generations, then nix-collect-garbage --delete-old
just list           # show all available recipes
```

`rebuild`/`debug` run `alejandra --quiet .` first — no separate format step needed.

Syntax check a single file:
```bash
nix-instantiate --eval --strict <file>
```

Zsh alias `j` runs `just` from the nixos dir regardless of cwd (when `zsh.enable = true`):
```
j rebuild   # same as `just rebuild`
```

## Structure

```
flake.nix                                 # entry point — mkHost wires home-manager + pkgsUnstable
hosts/lachata/                            # per-machine config
  default.nix                             #   imports modules/configuration + modules/home, toggles home features
  hardware-configuration.nix              #   auto-generated (nixos-generate-config), never edit
modules/configuration/                    # system-level NixOS, feature-gated via modules.<name>.enable
  default.nix, boot, fonts, nix, timezone, networking, keyboard, ly,
  hardware, services, gaming, shell, thunar, users
modules/home/                             # user-level Home Manager, feature-gated (flat, no subdirs)
  core.nix, packages.nix, git, gh, direnv, opencode, firefox,
  alacritty, mangohud, obs-studio, sway, waybar, wlsunset, mako, zsh, starship
```

## Hard Rules

- **ALWAYS** use home-manager (`modules/home/`) for user-level settings — never `nix-env` or ad-hoc system config.
- **Enable what you import**: every feature-gated module needs `modules.<name>.enable = true;` (system) or `<name>.enable = true;` (home) in `hosts/lachata/default.nix`. Importing alone does nothing.
- **Both config and home modules are feature-gated** via `lib.mkEnableOption`. Set to `true` in the host file to enable.

## Notable Patterns

- **`mkHost` factory** in `flake.nix`: wires home-manager + `specialArgs` + `pkgsUnstable`. Adding a host: `nixosConfigurations.<name> = mkHost "<name>"`. Also sets `home-manager.useGlobalPkgs = true` and `home-manager.backupFileExtension = "bak"`.
- **`pkgsUnstable`**: passed through `home-manager.extraSpecialArgs`. Use in `home.packages` via `++ [ pkgsUnstable.pkgname ]`. Imported with `config.allowUnfree = true`.
- **`with pkgs;`** only inside `home.packages` lists. Everywhere else, spell full paths (`lib.lists.optionals`, not `with lib;`).
- **`modules/configuration/shell.nix`** enables zsh system-wide (login shell). Per-user zsh config is in `modules/home/zsh.nix` (feature-gated).
- **OpenCode MCP**: `modules/home/opencode.nix` configures a local MCP server for `mcp-nixos` — agents can query NixOS options + nixpkgs through it.

## Code Style

- Indent: 2 spaces.
- Functions: `{ config, lib, pkgs, ... }: { ... }` — destructure only what's used.
- Feature-gated module pattern (home): `let cfg = config.<name>; in { options.<name>.enable = lib.mkEnableOption "..."; config = lib.mkIf cfg.enable { ... }; }`
- Feature-gated module pattern (config): same but uses `config.modules.<name>` and `options.modules.<name>.enable` with `// {default = true;}`
- Multi-element lists: one per line. Single-element: inline.
- Strings: double quotes normally, `''...''` for multi-line.
- Naming: kebab-case files, camelCase attrs/vars, dot-separated NixOS options.

## Git

- Remote: `git@github.com:DanteZulli/my-nixos-configs.git`
- Branch: `main`, `push.autoSetupRemote = true` configured.
- Commit messages: imperative mood, lowercase, no trailing period.
