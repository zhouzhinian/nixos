{
  config,
  lib,
  pkgs,
  ...
}:
{

services.displayManager.gdm.enable = true;
services.desktopManager.gnome.enable = true;
services.udev.packages = with pkgs; [ gnome-settings-daemon ];
services.gnome.core-developer-tools.enable = false;
services.gnome.games.enable = false;
programs.dconf.enable = true;
services.gnome.core-apps.enable = false;

environment.systemPackages = with pkgs; [
	  gnome-tweaks
	  gnome-menus
    nautilus
    file-roller
    gnome-disk-utility
    gnome-shell-extensions
	  adwaita-icon-theme
	  gnome-backgrounds
    gnome-color-manager
    gnome-control-center
    gnome-shell-extensions
    gnome-menus
    gtk3.out # for gtk-launch program
    xdg-user-dirs # Update user dirs as described in https://freedesktop.org/wiki/Software/xdg-user-dirs/
    xdg-user-dirs-gtk # Used to create the default bookmarks
    gnome-text-editor
    gnome-calculator
    gnome-calendar
    gnome-characters
    gnome-font-viewer
    gnome-system-monitor
    loupe
    gnome-software
    ptyxis
	gnomeExtensions.clipboard-indicator
	gnomeExtensions.logo-menu
	gnomeExtensions.kimpanel
	gnomeExtensions.appindicator
	gnomeExtensions.user-themes
	gnomeExtensions.dash-to-dock
	gnomeExtensions.blur-my-shell
	gnomeExtensions.lock-keys
	gnomeExtensions.just-perfection
	gnomeExtensions.forge
	gnomeExtensions.hide-top-bar

   ];

  }
