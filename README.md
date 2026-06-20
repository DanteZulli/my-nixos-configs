# My NixOS Configuration

Personal NixOS + Home Manager flake for **x86_64-linux** machines, built with the [Den framework](https://github.com/vic/den).

## Repository layout

- `modules/`: Den framework modules (host, user, services, desktop, tooling, etc.)
- `modules/hosts/<machine>/`: per-host config + [NixOS Facter](https://github.com/nix-community/nixos-facter) hardware report (`facter.json`)
- `assets/`: shared assets

## Common commands

### Rebuild and switch (system + home)

```shell
just rebuild
```

### Update all flake inputs

```shell
just update
```

### Test config in a QEMU VM

```shell
just vm
```

### Syntax-check a single file

```shell
nix-instantiate --eval --strict <file>
```

## Adding a new host

1. **On the target machine**, generate a hardware report:

   ```shell
   sudo nix run nixpkgs#nixos-facter -- -o facter.json
   ```

2. **In this repo**, create `modules/hosts/<hostname>/` with the `facter.json` and a
   `<hostname>.nix` file declaring the host entity and its aspects (includes, filesystems,
   etc.) — see `modules/hosts/lachata/lachata.nix` as a reference.

   If the user is `dante`, it's already defined in `modules/users/dante.nix` and will be
   enabled automatically via `den.batteries.host-aspects`.

3. **Regenerate `flake.nix`**:

   ```shell
   nix run .#write-flake
   ```

4. Commit and push.

5. **On the target machine**, clone the repo and switch to the new configuration:

   ```shell
   sudo nix run github:nix-community/nh -- .#<hostname> -- switch
   ```
