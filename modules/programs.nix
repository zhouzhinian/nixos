{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
  zenPkgs = inputs.zen-browser.packages.${system};
  # Zen 官方重新上传了 1.23.3b 二进制，flake 里的 hash 已过时，这里做本地覆盖。
  # 上游修复后可删除此覆盖。
  zenUnwrappedFixed = zenPkgs.zen-browser-unwrapped.override {
    hash = "sha256-uyBF0+IWVNQP6EElAJLurf0sH8gx7vtQkiJ3PIvcoUk=";
  };
  zenBrowserFixed = zenPkgs.zen-browser.override {
    zen-browser-unwrapped = zenUnwrappedFixed;
  };
in {
  environment.systemPackages = with pkgs; [
    zenBrowserFixed
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
    yazi
  ];

  programs.direnv.enable = true;
}
