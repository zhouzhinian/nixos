{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # --- 系统引导 ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # --- 网络 ---
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  system.stateVersion = "26.11";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # --- 本地化与输入 ---
  time.timeZone = "Asia/Shanghai";

  console = {
    font = "${pkgs.terminus_font}/share/consolefonts/ter-u28n.psf.gz";
    useXkbConfig = true;
  };

  # --- 环境变量 ---
  environment.sessionVariables = {
    GDK_GL = "gles";
    NIXOS_OZONE_WL = "1";
  };

  # --- 音频 ---
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };
  security.rtkit.enable = true;

  # --- 用户与安全 ---
  users.users.zhinian = {
    isNormalUser = true;
    description = "周治年";
    extraGroups = [ "networkmanager" "wheel" "kvm" ];
  };

  nixpkgs.config.allowUnfree = true;
  # 若某包需要放行 insecure 版本，请用 nixpkgs.config.permittedInsecurePackages = [ "包名" ];
  services.openssh.enable = false;

  # --- 基本软件包 ---
  environment.systemPackages = with pkgs; [
    git
    wget
    ripgrep
    jq
    yq-go
    eza
    fzf
    which
    file
    gnused
    zstd
    gnupg
    aria2
    tree
    zip
    xz
    unzip
    p7zip
    rustup
    fastfetch
    btop
  ];

  # --- 桌面应用与服务 ---
  programs.firefox.enable = true;
  programs.clash-verge.enable = true;

  ## Flatpak
  services.flatpak.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  ## --zsh
  programs.zsh.enable = true;
  users.users.zhinian.shell = pkgs.zsh;
  # 将 Flathub remote 指向 SJTU 国内镜像
  systemd.services.flatpak-sjtu-mirror = {
    description = "Point Flathub remote to SJTU mirror";
    wantedBy = [ "multi-user.target" ];
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists --system flathub https://mirrors.sjtug.sjtu.edu.cn/flathub/flathub.flatpakrepo
      ${pkgs.flatpak}/bin/flatpak remote-modify --system flathub --url=https://mirrors.sjtug.sjtu.edu.cn/flathub
    '';
  };
}
