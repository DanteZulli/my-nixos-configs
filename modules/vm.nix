{inputs, ...}: let
  hosts = builtins.attrNames inputs.self.nixosConfigurations;
  mkVm = hostname: let
    host = inputs.self.nixosConfigurations.${hostname};
    vm = host.extendModules {
      modules = [
        {users.users.dante.initialPassword = "dante";}
      ];
    };
  in {
    "vm-${hostname}" = host.pkgs.writeShellApplication {
      name = "vm-${hostname}";
      text = ''
        ${vm.config.system.build.vm}/bin/run-${hostname}-vm "$@"
      '';
    };
  };
in {
  perSystem = {pkgs, ...}: {
    packages = builtins.foldl' (acc: name: acc // (mkVm name)) {} hosts;
  };
}
