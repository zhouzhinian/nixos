{
  description = "NixOS with DeepSeek Harness";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    deepseek-harness.url = "github:moraxyc/deepseek-harness.nix";
  };

  outputs = { self, nixpkgs, deepseek-harness, ... }@inputs:
  let
    system = "x86_64-linux";
    # 自动扫描 modules 目录下的所有 .nix 文件
    configDir = ./modules;
    generatedModules = builtins.map (file: configDir + "/${file}")
      (builtins.filter (file: nixpkgs.lib.hasSuffix ".nix" file)
        (builtins.attrNames (builtins.readDir configDir)));
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        deepseek-harness.nixosModules.default
      ] ++ generatedModules;
    };
  };
}
