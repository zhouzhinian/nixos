{ config, pkgs, lib, ...} :

{
    programs.dms-shell = {
    enable = true;
    
    systemd.enable = true;

    enableSystemMonitoring = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableVPN = true;
    enableClipboardPaste = true;
    enableCalendarEvents = true;
   };
  programs.dsearch = {
  enable = true;

  # Use a custom package (optional)
  package = pkgs.dsearch;

  # Systemd service configuration
  systemd = {
    enable = true;               # Enable systemd user service
    target = "default.target";   # Start with user session
  };
};

}
