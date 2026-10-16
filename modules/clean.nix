{ ... }:
{
  # 清除

  # 只保留最近 2 个引导项（systemd-boot 开机菜单）
  boot.loader.systemd-boot.configurationLimit = 2;

  # 每周自动 GC（原生选项）
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # 自动优化 store（节省磁盘空间）
  nix.settings.auto-optimise-store = true;
}
