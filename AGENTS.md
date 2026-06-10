# AGENTS.md

Single-host NixOS flake (`lachata`, user `dante`, x86_64-linux).
System: `nixos-26.05`, home-manager: `release-26.05` (`system.stateVersion` = `"25.11"` — expected to lag behind).

## Commands

```bash
just rebuild        # check + format (alejandra) + nixos-rebuild switch (system + home-manager)
just debug          # rebuild with --show-trace --verbose
just update         # nix flake update
just clean          # keep last 10 system + user generations, then nix-collect-garbage --delete-old
just list           # show all available recipes
```

`rebuild`/`debug` run `alejandra` first — no separate format step needed.

Syntax check a single file:
```bash
nix-instantiate --eval --strict <file>
```

Zsh alias `j` runs `just` from the nixos dir regardless of cwd (when `zsh.enable = true`).

## Structure

```
flake.nix                                 # entry point — mkHost helper wires home-manager + pkgsUnstable
hosts/lachata/                            # NixOS system config
  default.nix                             #   imports modules/nixos, enables home modules
  hardware-configuration.nix              #   auto-generated, never edit directly
modules/nixos/                            # system-level, always-on (14 files)
  boot, fonts, nix, timezone, networking, keyboard, ly, hardware,
  services, gaming, shell, thunar, users
modules/home/                             # user-level Home Manager, feature-gated
  core.nix, packages.nix                  #   username/stateVersion, user packages
  cli/                                    #   git, gh, direnv, opencode (enable option per module)
  gui/                                    #   firefox, alacritty, mangohud, sway, waybar, ...
  shell/                                  #   zsh, starship
```

## Hard Rules

- **ALWAYS** use home-manager (`modules/home/`) for user-level settings — never `nix-env` or ad-hoc system config.
- **Enable what you import**: every feature-gated home module needs `moduleName.enable = true;` in `hosts/lachata/default.nix`. Importing alone does nothing.
- **NixOS modules are always-on** — no `enable` option. They activate on import. Home modules are the opposite (feature-gated via `lib.mkEnableOption`).

## Notable Patterns

- **`mkHost` factory**: `flake.nix` wires home-manager + `specialArgs` + `pkgsUnstable`. Adding a host: `nixosConfigurations.<name> = mkHost "<name>";`
- **`pkgsUnstable`**: passed through `home-manager.extraSpecialArgs`. Use in `home.packages` via `++ [ pkgsUnstable.pkgname ]`.
- **`with pkgs;`** only inside `home.packages` lists. Everywhere else, spell full paths (`lib.lists.optionals`, not `with lib;`).

## Code Style

- Indent: 2 spaces.
- Functions: `{ config, lib, pkgs, ... }: { ... }` — destructure only what's used.
- Feature-gated module pattern: `let cfg = config.<name>; in { options.<name>.enable = lib.mkEnableOption "..."; config = lib.mkIf cfg.enable { ... }; }`
- Multi-element lists: one per line. Single-element: inline.
- Strings: double quotes normally, `''...''` for multi-line.
- Naming: kebab-case files, camelCase attrs/vars, dot-separated NixOS options.

## Git

- Remote: `git@github.com:DanteZulli/my-nixos-configs.git`
- Branch: `main`, `push.autoSetupRemote = true` configured.
- Commit messages: imperative mood, lowercase, no trailing period.
