{ inputs, config, lib, pkgs, ... }: {
   environment.systemPackages = with pkgs; [
   helix
   vlc
   papirus-icon-theme
   mint-cursor-themes
   dracula-icon-theme
   dracula-theme
   qbittorrent-enhanced
   tokyonight-gtk-theme
   thunderbird
   obs-studio
 #  sparkle
   splayer
   satty
   zed-editor
   github-desktop
  ];

# vscode chajian
programs.direnv.enable = true;
programs.clash-verge.enable = true;
qt.enable = true;
qt.platformTheme = "qt5ct";
qt.style = "kvantum";

}

