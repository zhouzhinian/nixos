{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    helix
    vlc
    papirus-icon-theme
    mint-cursor-themes
    dracula-icon-theme
    dracula-theme
    qbittorrent-enhanced
    tokyonight-gtk-theme
    obs-studio
    zed-editor
    splayer-next
    wpsoffice-cn
  ];

  programs.direnv.enable = true;
}
