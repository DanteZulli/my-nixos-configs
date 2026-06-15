{ den, ... }:
{
  den.aspects.networking.nixos = {
    networking = {
      networkmanager.enable = true;

      firewall = {
        enable = true;
        allowedTCPPorts = [ ];
        allowedUDPPorts = [ ];
      };
    };
  };
}
