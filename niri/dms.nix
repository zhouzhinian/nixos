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

        package = pkgs.dsearch;

        systemd = {
            enable = true;
            target = "default.target";
        };
    };
}
