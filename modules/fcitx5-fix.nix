# 修复 WPS 等 XWayland Qt 应用无法调用 Fcitx5 输入法
#
# 根因：fcitx5.waylandFrontend = true 会让 NixOS 的 fcitx5 模块跳过
#       QT_IM_MODULE / GTK_IM_MODULE 的设置；同时 WPS 自带 Qt5
#       （dontWrapQtApps），而模块只把 Qt6 插件放进 QT_PLUGIN_PATH，
#       导致 WPS 的 Qt5 既没有 IM_MODULE 也找不到 fcitx5 的 Qt5 输入法插件。
{ pkgs, ... }:

{
  environment.variables = {
    QT_IM_MODULE = "fcitx";
    GTK_IM_MODULE = "fcitx";
    QT_PLUGIN_PATH = [
      "${pkgs.libsForQt5.fcitx5-qt}/${pkgs.qt5.qtbase.qtPluginPrefix}"
      "${pkgs.qt6Packages.fcitx5-qt}/${pkgs.qt6.qtbase.qtPluginPrefix}"
    ];
  };
}
