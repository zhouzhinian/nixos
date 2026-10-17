# niri + Hyprland + DankMaterialShell (DMS)
#
# - niri：滚动式平铺 Wayland 合成器（nixpkgs 自带）
# - Hyprland：平铺 Wayland 合成器（flake 安装，见 flake.nix 的 hyprland 输入）
# - DMS（DankMaterialShell）：Quickshell 桌面外壳，替代 waybar/swaylock/mako/
#   fuzzel/polkit 等一整套，运行在 niri/hyprland 之上（flake 安装）
{ pkgs, ... }:

{
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";  # Or "hyprland" or "sway"
  };    
  programs.niri.enable = true;

  programs.hyprland.enable = true;

  programs.dank-material-shell = {
    enable = true;
    # 用 systemd 用户服务自启（挂在 graphical-session.target 下，崩溃会自动重启）
    systemd.enable = true;
  };

  programs.dsearch.enable = true;

  environment.systemPackages = [
    pkgs.dankcalendar
    pkgs.adw-gtk3
    pkgs.fprintd
    pkgs.kdePackages.dolphin
    pkgs.kdePackages.qt6ct
    pkgs.kitty
  ];
}
