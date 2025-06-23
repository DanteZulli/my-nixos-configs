# NixOS System Configs

This repository contains my personal NixOS and home-manager setup, maintained with love and a touch of chaos. It uses Nix flakes to provide a modular, reproducible system configuration.

## Setup Overview

I treat my NixOS system as a flake, stored in my home directory. This includes a copy of `configuration.nix` along with other necessary files. To apply the configuration, I use the command `sudo nixos-rebuild switch --flake .#hostname`, and I have set up aliases to make managing different machines easier.

Home Manager is integrated as a module inside NixOS, rather than being used as a standalone tool. This allows me to manage dotfiles and personal configurations directly within NixOS, creating a seamless setup across all systems.

## Acknowledgments

This setup was inspired by several helpful resources, including:

- [Misterio77's Nix Starter Configs](https://github.com/Misterio77/nix-starter-configs/tree/main)
- [NixOS and Flakes](https://nixos-and-flakes.thiscute.world/)

I’ve also used the official NixOS documentation extensively.

For anyone looking to deepen their understanding of NixOS and Flakes, I highly recommend checking out the [Vimjoyer YouTube channel](https://www.youtube.com/@vimjoyer). It has been very useful.

