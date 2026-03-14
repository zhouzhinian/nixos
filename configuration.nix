
{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      	./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.enable = true;

  system.stateVersion = "25.11"; 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  time.timeZone = "Asia/Shanghai";

  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
    useXkbConfig = true;
  };

  environment.sessionVariables = {
    GDK_GL = "gles";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    NIXPKGS_ALLOW_INSECURE = "1";
  };
  nixpkgs.config.permittedInsecurePackages = [
   "openssl-1.1.1w"
  ];
    # 开启图形加速支持 
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };

   services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  security.rtkit.enable = true;

  
  # --- 6. 用户与安全 ---
  users.users.zhinian = {
    isNormalUser = true;
    description = "周治年";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "qemu" "kvm" "docker" "incus-admin"]; 
  };

  nixpkgs.config.allowUnfree = true;
  services.openssh.enable = true;

  nix.settings = {
  substituters = [
    "https://mirrors.ustc.edu.cn/nix-channels/store"     # 中科大（可优先）
    "https://mirror.sjtu.edu.cn/nix-channels/store"     
    "https://cache.nixos.org/"
  ];
  trusted-public-keys = [
    "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  ];
 };

  # 基本软件包
  environment.systemPackages = with pkgs; [
     git wget ripgrep jq yq-go eza fzf which file gnused zstd gnupg aria2 
     tree zip xz unzip p7zip
     rustup fastfetch 
   ];

# programs.firefox.enable = true;

 programs.clash-verge.enable = true;
     ## Flatpak
 services.flatpak.enable = true;  
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "gtk";

 programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}

